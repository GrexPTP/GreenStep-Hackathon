import React from 'react'
import {Card, Title, Paragraph } from 'react-native-paper';
const DescribedCard = ({thumbnail, title, description, width, handler}) => (
    <Card style={{width, marginBottom: 10}} onPress={() => handler()}>
      <Card.Cover source={{ uri: thumbnail }} />
      <Card.Content>
        <Title style={{textAlign:'center'}}>{title}</Title>
        <Paragraph style={{textAlign: "justify"}}>{description}</Paragraph>
      </Card.Content>
    </Card>
  );
export default DescribedCard