import React from 'react';
import {setGlobal} from 'reactn'
import {Ionicons} from '@expo/vector-icons';
import { StyleSheet, Text, View, Button } from 'react-native';
import { createAppContainer } from "react-navigation";
import {createBottomTabNavigator} from "react-navigation-tabs";
import HomePage from './pages/HomePage';
import EventsPage from './pages/EventsPage';
import ProfilePage from './pages/ProfilePage';
import MyEventsPage from './pages/MyEventsPage'
import IconWithBadge from './components/IconWithBadge'
import Constants from 'expo-constants';
import SignUpSignInPage from './pages/SignUpSignInPage'
import LoginPage from './pages/LoginPage'
import RegisterPage from './pages/RegisterPage'
import ForgotPasswordPage from './pages/ForgotPasswordPage'
import { createStackNavigator } from 'react-navigation-stack';


const getTabBarIcon = (navigation, focused, tintColor) => {
    const { routeName } = navigation.state;
    let iconName;
    let IconComponent = Ionicons;
    if (routeName === 'Home') {
      iconName = `ios-home`;
      // We want to add badges to home tab icon
      IconComponent = HomeIconWithBadge;
    } else if (routeName === 'Events' ) {
      iconName = `ios-list`;
    } else if (routeName === 'Profile' ) {
      iconName = `ios-person`;
    } else if (routeName === 'MyEvents') {
      iconName = `ios-filing`;
    } else {
      iconName = `ios-map`
    }
    // You can return any component that you like here!
    return <IconComponent name={iconName} size={25} color={tintColor} />;
    
  };
  const HomeIconWithBadge = props => {
    // You should pass down the badgeCount in some other ways like context, redux, mobx or event emitters.
    return <IconWithBadge {...props} badgeCount={3} />;
  };
const AppNavigator = createBottomTabNavigator({
    Home: {
      screen: HomePage
    },
    Events: {
      screen: EventsPage
    },
    MyEvents:{
      screen: MyEventsPage,
      navigationOptions: {
        tabBarLabel: 'My Events'
      }
    },
    Profile: {
        screen: ProfilePage
    }
  }, {
    initialRouteName: "Home",
    defaultNavigationOptions: ({ navigation }) => ({
        tabBarIcon: ({ focused, tintColor }) =>
          getTabBarIcon(navigation, focused, tintColor),
      }),
      tabBarOptions: {
        activeTintColor: 'purple',
        inactiveTintColor: 'gray',
      },
  });
  const AuthenRouter = createStackNavigator(
    {
      SignUpSignInPage,
      LoginPage,
      RegisterPage,
      ForgotPasswordPage,
      HomePage : {
        screen: createAppContainer(AppNavigator)
      }
    },
    {
      initialRouteName: 'SignUpSignInPage',
      headerMode: 'none',
    }
  );
//const AppContainer = createAppContainer(AppNavigator)
const AppContainer = createAppContainer(AuthenRouter)   
const App = () => {
  setGlobal({
    user: null
  })
  return (
    <View style={{flex: 1}}>
        <AppContainer/>
    </View>
)
}
export default App
