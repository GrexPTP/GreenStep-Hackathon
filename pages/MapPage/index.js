import React from 'react'
import {View} from 'react-native'
import Constants from 'expo-constants';
import Map from '../../components/Map'
const MapPage = () => {
    return(
        <View style={{ flex: 1,  flexDirection:'column', paddingTop: Constants.statusBarHeight}}>
            <Map/>
        </View>
    )
}
export default MapPage