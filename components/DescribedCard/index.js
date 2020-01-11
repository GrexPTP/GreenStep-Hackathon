import React from 'react'
import {Card, Title, Paragraph } from 'react-native-paper';
const DescribedCard = ({id, name, description,  width, handler}) => (
    <Card style={{width, marginBottom: 10}} onPress={() => handler(id)}>
      <Card.Cover source={{ uri: 'https://gongcha.com.vn/wp-content/uploads/2019/10/phổ-nhĩ.thử.799x500-01.jpg' }} />
      <Card.Content>
        <Title style={{textAlign:'center'}}>{name}</Title>
        <Paragraph style={{textAlign: "justify"}}>{description}</Paragraph>
      </Card.Content>
    </Card>
  );
export default DescribedCard