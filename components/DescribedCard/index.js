import React from 'react'
import {Card, Title, Paragraph } from 'react-native-paper';
const DescribedCard = ({id, name, description,  width, handler,images}) => (
    <Card style={{width, marginBottom: 10}} onPress={() => handler(id)}>
      <Card.Cover source={{ uri: `http://13.76.100.205/storage/${JSON.parse(images)[0]}` }} />
      <Card.Content>
        <Title style={{textAlign:'center'}}>{name}</Title>
        <Paragraph style={{textAlign: "justify"}}>{description}</Paragraph>
      </Card.Content>
    </Card>
  );
export default DescribedCard