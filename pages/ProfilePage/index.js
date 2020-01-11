import React from 'react'
import {View, ScrollView} from 'react-native'
import {Avatar, Card, Title, Paragraph, Text} from 'react-native-paper'
import Constants from 'expo-constants';
const ProfilePage = () => {
    return(
        <View style={{ flex: 1,  flexDirection:'column', paddingTop: Constants.statusBarHeight}}>
            <View style={{flex: 1, backgroundColor: 'purple', alignItems:'center', justifyContent:'center'}}><Avatar.Image size={100} source={{uri: 'https://cdn4.iconfinder.com/data/icons/logos-3/600/React.js_logo-512.png'}}/></View>
            <View style={{flex: 2}}>
                <ScrollView>
                    <Card style={{margin: 10}} >
                          <Card.Title title={'Basic Info'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                            <Paragraph style={{fontSize:18}}>{`Full name: Nguyen Van A`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`Birth date: 22/08/1999`}</Paragraph>
                          </Card.Content>
                        </Card>
                        <Card style={{margin: 10}} >
                          <Card.Title title={'Contact Info'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                            <Paragraph style={{fontSize:18}}>{`Email: anv@fpt.edu.vn`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`Phone: 0899467737`}</Paragraph>
                          </Card.Content>
                        </Card>
                        <Card style={{height: 200,margin: 10}} >
                          <Card.Title title={'Coupon'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                                <Paragraph>
                                    <Text style={{fontSize:18}}>Coupon Name: ABC Coupon {'\n'}</Text>
                                    <Text>Received Date: 20/10/2020</Text>
                                </Paragraph>
                                <Paragraph>
                                    <Text style={{fontSize:18}}>Coupon Name: ABC Coupon {'\n'}</Text>
                                    <Text>Received Date: 20/10/2020</Text>
                                </Paragraph>
                          </Card.Content>
                        </Card>
                    </ScrollView>
                </View>                
            </View>
    )
}
export default ProfilePage