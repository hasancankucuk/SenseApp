import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Button ,Text, TextInput, View, Alert } from 'react-native';


export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.yazi}>Hoş Geldiniz</Text>
      <Button
        color="blue"
        title="Başlamak için buraya tıklayın"
        onPress={() => Alert.alert('Başarılı')}
      />
      <Text>Adınızı yazınız</Text>
      <TextInput
      style={{ height: 40, borderColor: 'gray', borderWidth: 1 }}
      onChangeText={text => onChangeText(text)}
      value={value}
    />
      <StatusBar style="dark"/>
      
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex:1,
    backgroundColor: 'skyblue',
    alignItems: 'center',
    justifyContent: 'center',
  },
  yazi: {
   fontSize:50,
   fontWeight:'bold',
   color:'black',

  }
});
