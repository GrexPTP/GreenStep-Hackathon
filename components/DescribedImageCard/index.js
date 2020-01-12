import React from 'react'
import {Card, Title, Paragraph, Text } from 'react-native-paper';
const DescribedImageCard = ({image, width}) => (
    <Card style={{width, marginBottom: 10}}>
      <Card.Cover source={{ uri: `http://13.76.100.205/storage/${image}`}} />
      
      
    </Card>
  );
export default DescribedImageCard