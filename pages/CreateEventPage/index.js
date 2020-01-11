import React, {useState} from 'react'
import {View, Keyboard} from 'react-native'
import { TextInput, RadioButton, Text } from 'react-native-paper';
import DateTimePicker from '@react-native-community/datetimepicker';
const CreateEventPage = () =>  {
    const [name, setName] = useState('')
    const [location, setLocation] = useState('')
    const [description, setDescription] = useState('')
    const [type, setType] = useState('time')
    const [date, setDate] = useState(new Date())
    const [time, setTime] = useState(new Date())
    const [dateShow, setDateShow] = useState(false)
    const [timeShow, setTimeShow] = useState(false)
    const setDateInput = (dateValue, date) => {
        Keyboard.dismiss()
        const currentDate = dateValue || date 
        setDate(currentDate)
        setTimeout(() => {
            setDateShow(false)
          }, 250);
        
        
    }
    const setTimeInput = (dateValue, time) => {
        Keyboard.dismiss()
        const currentDate = dateValue || time 
        setTime(currentDate)
        setTimeout(() => {
            setTimeShow(false)
          }, 250);
        
        
    }
    return (
    <View style={{flex: 1, padding: 25}}>
        <TextInput
        mode='outlined'
        label='Event Name'
        value={name}
        onChangeText={text => setName(text)}
      />
      <TextInput
      mode='outlined'
        label='Location'
        value={location}
        onChangeText={text => setLocation(text)}
      />
      <TextInput
      mode='outlined'
        multiline
        numberOfLines={5.0}
        label='Description'
        value={description}
        onChangeText={text => setDescription(text)}
      />
      <View>

      </View>
      <RadioButton.Group>
          <View style={{flexDirection:'row'}}>
          <Text>Time</Text>
          <RadioButton
          value="time"
          status={type === 'time' ? 'checked' : 'unchecked'}
          onPress={() => setType('time') }
        />
            <Text>{date.toDateString()}</Text>
          </View>
        <View style={{flexDirection:'row'}}>
        <Text>Step</Text>
        <RadioButton
          value="step"
          status={type === 'step' ? 'checked' : 'unchecked'}
          onPress={() => setType('step') }
        />
        </View>
      </RadioButton.Group>

      <TextInput
      mode='outlined'
        label='Date'
        value={date}
        onFocus={() => setDateShow(true)}
      />
      {dateShow &&  <DateTimePicker  value={date} onChange={(event, dateValue) => setDateInput(dateValue, date)}/>}

      <TextInput
      mode='outlined'
        label='Time'
        value={time}
        onFocus={() => setTimeShow(true)}
      />
      {timeShow && <DateTimePicker mode={'time'} value={time} onChange={(event, dateValue) => setTimeInput(dateValue, time)} />}
      
    </View>
)}
export default CreateEventPage