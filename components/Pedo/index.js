import React from "react";
import { Pedometer } from "expo-sensors";
import { StyleSheet, Text, View } from "react-native";
import AnimatedProgressWheel from 'react-native-progress-wheel';
import { Button } from "react-native-paper";
export default class Pedo extends React.Component {
  state = {
    isPedometerAvailable: "checking",
    pastStepCount: 0,
    currentStepCount: 0,
    totalStep : 1
  };

  componentDidMount() {
    this._subscribe();
  }

  componentWillUnmount() {
    this._unsubscribe();
  }

  _subscribe = () => {
    const {totalStep} = this.state
    const {setComplete} = this.props
    this._subscription = Pedometer.watchStepCount(result => {
      if (totalStep == result.steps)
        setComplete(true)
        this.setState({
        currentStepCount: result.steps
      });
    });

    Pedometer.isAvailableAsync().then(
      result => {
        this.setState({
          isPedometerAvailable: String(result)
        });
      },
      error => {
        this.setState({
          isPedometerAvailable: "Could not get isPedometerAvailable: " + error
        });
      }
    );

    const end = new Date();
    const start = new Date();
    start.setDate(end.getDate() - 1);
    Pedometer.getStepCountAsync(start, end).then(
      result => {
        this.setState({ pastStepCount: result.steps });
        
      },
      error => {
        this.setState({
          pastStepCount: "Could not get stepCount: " + error
        });
      }
    );
  };

  _unsubscribe = () => {
    this._subscription && this._subscription.remove();
    this._subscription = null;
  };
  render() {
    const {currentStepCount, totalStep} = this.state
    return (
      currentStepCount == totalStep ? <Button mode="text" onPress={() => console.log('lo')}>Receive Coupon</Button>
      : <View style={styles.container}>   
      <AnimatedProgressWheel
      size={120} 
      width={20} 
      color={'white'}
      fullColor={'purple'}
      progress={(currentStepCount / totalStep) * 100}
      backgroundColor={'pink'}/>
      <Text style={{color: 'grey', margin: 5}}>{`Step: ${currentStepCount}/${totalStep}`}</Text>
     </View>
    );
  }
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    marginTop: 15,
    alignItems: "center",
    justifyContent: "center"
  }
});
