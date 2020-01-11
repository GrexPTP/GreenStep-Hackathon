import React from 'react'
import {View, ScrollView} from 'react-native'
import {Avatar, Card, Title, Paragraph, Text} from 'react-native-paper'
import Constants from 'expo-constants';
import {useGlobal} from 'reactn'
const ProfilePage = () => {
    const [user, setUser] = useGlobal('user')
    return(
        <View style={{ flex: 1,  flexDirection:'column', paddingTop: Constants.statusBarHeight}}>
            <View style={{flex: 1, backgroundColor: 'purple', alignItems:'center', justifyContent:'center'}}><Avatar.Image size={100} source={{uri: 'https://cdn4.iconfinder.com/data/icons/logos-3/600/React.js_logo-512.png'}}/></View>
            <View style={{flex: 2}}>
                <ScrollView>
                    <Card style={{margin: 10}} >
                          <Card.Title title={'Basic Info'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                            <Paragraph style={{fontSize:18}}>{`Full name: ${user.name}`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`Birth date: ${user.birthdate}`}</Paragraph>
                          </Card.Content>
                        </Card>
                        <Card style={{margin: 10}} >
                          <Card.Title title={'Contact Info'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                            <Paragraph style={{fontSize:18}}>{`Email: ${user.email}`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`Phone: ${user.phone}`}</Paragraph>
                          </Card.Content>
                        </Card>
                        <Card style={{height: 200,margin: 10}} >
                          <Card.Title title={'Joined Events'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                                <Paragraph>
                                    <Text style={{fontSize:18}}>Event Name: ABC {'\n'}</Text>
                                    <Text> Date joined: 20/10/2020</Text>
                                </Paragraph>
                                <Paragraph>
                                    <Text style={{fontSize:18}}>Event Name: ABC {'\n'}</Text>
                                    <Text> Date joined: 20/10/2020</Text>
                                </Paragraph>
                          </Card.Content>
                        </Card>
                        <Card style={{height: 200,margin: 10}} >
                          <Card.Title title={'Created Events'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                                <Paragraph>
                                    <Text style={{fontSize:18}}>Event Name: ABC {'\n'}</Text>
                                    <Text> Date created: 20/10/2020</Text>
                                </Paragraph>
                                <Paragraph>
                                    <Text style={{fontSize:18}}>Event Name: ABC {'\n'}</Text>
                                    <Text> Date created: 20/10/2020</Text>
                                </Paragraph>
                          </Card.Content>
                        </Card>
                    </ScrollView>
                </View>                
            </View>
    )
}
export default ProfilePage