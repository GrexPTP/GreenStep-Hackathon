import React from 'react'
import {Card, Title, Paragraph, Text } from 'react-native-paper';
const DescribedImageCard = ({image, width}) => (
    <Card style={{width, marginBottom: 10}}>
      <Card.Cover source={{ uri: `https://gongcha.com.vn/wp-content/uploads/2019/10/phổ-nhĩ.thử.799x500-01.jpg` }} />
      
      <Card.Content>
            <Title>{`13.76.100.205/storage/events/${image}`}</Title>
      </Card.Content>
    </Card>
  );
export default DescribedImageCard