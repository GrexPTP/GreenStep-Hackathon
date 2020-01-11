import React, {useState} from 'react'
import {View, Keyboard, ScrollView} from 'react-native'
import { TextInput, RadioButton, Text, Button } from 'react-native-paper';
import DateTimePicker from '@react-native-community/datetimepicker';
const CreateEventPage = () =>  {
    const [name, setName] = useState('')
    const [location, setLocation] = useState('')
    const [description, setDescription] = useState('')
    const [type, setType] = useState('time')
    const [date, setDate] = useState(new Date())
    const [time, setTime] = useState(new Date())
    const [dateEnd, setDateEnd] = useState(new Date())
    const [timeEnd, setTimeEnd] = useState(new Date())
    const [dateShow, setDateShow] = useState(false)
    const [timeShow, setTimeShow] = useState(false)
    const [dateShowEnd, setDateShowEnd] = useState(false)
    const [timeShowEnd, setTimeShowEnd] = useState(false)
    const setDateInput = (dateValue, date) => {
        Keyboard.dismiss()
        const currentDate = dateValue || date 
        setDateShow(false)
        setDate(currentDate)


        
        
    }
    const setTimeInput = (dateValue, time) => {
        Keyboard.dismiss()
        const currentDate = dateValue || time 
        setTimeShow(false)
        setTime(currentDate)

        
    }
    const setDateEndInput = (dateValue, date) => {
        Keyboard.dismiss()
        const currentDate = dateValue || date 
        setDateShowEnd(false)
        setDateEnd(currentDate)


        
        
    }
    const setTimeEndInput = (dateValue, time) => {
        Keyboard.dismiss()
        const currentDate = dateValue || time 
        setTimeShowEnd(false)
        setTimeEnd(currentDate)

        
    }
    return (
        <ScrollView>
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
          <View style={{flexDirection: 'row', justifyContent:'center'}}>
          <View style={{flexDirection:'row'}}>
          <Text>Time</Text>
          <RadioButton
          value="time"
          status={type === 'time' ? 'checked' : 'unchecked'}
          onPress={() => setType('time') }
        />
            
          </View>
        <View style={{flexDirection:'row'}}>
        <Text>Step</Text>
        <RadioButton
          value="step"
          status={type === 'step' ? 'checked' : 'unchecked'}
          onPress={() => setType('step') }
        />
        </View>
          </View>
          
      </RadioButton.Group>

      <TextInput
      mode='outlined'
        label='Start Date'
        value={date.toDateString()}
        onFocus={() => setDateShow(true)}
      />
      {dateShow &&  <DateTimePicker  value={date} onChange={(event, dateValue) => setDateInput(dateValue, date)}/>}

      <TextInput
      mode='outlined'
        label='Start Time'
        value={`${time.getHours().toString()}:${time.getMinutes().toString()}:${time.getSeconds().toString()}`}
        onFocus={() => setTimeShow(true)}
      />
      {timeShow && <DateTimePicker mode={'time'} value={time} onChange={(event, dateValue) => setTimeInput(dateValue, time)} />}


      <TextInput
      mode='outlined'
        label='End Date'
        value={dateEnd.toDateString()}
        onFocus={() => setDateShowEnd(true)}
      />
      {dateShowEnd &&  <DateTimePicker  value={dateEnd} onChange={(event, dateValue) => setDateEndInput(dateValue, date)}/>}

      <TextInput
      mode='outlined'
        label='End Time'
        value={`${timeEnd.getHours().toString()}:${timeEnd.getMinutes().toString()}:${timeEnd.getSeconds().toString()}`}
        onFocus={() => setTimeShowEnd(true)}
      />
      {timeShowEnd && <DateTimePicker mode={'time'} value={timeEnd} onChange={(event, dateValue) => setTimeEndInput(dateValue, time)} />}
      
    </View>
    <Button>Create Event</Button>
        </ScrollView>
    
)}
export default CreateEventPage