import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Button ,Text, View, Alert } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.yazi}>Hoş Geldiniz</Text>

      <StatusBar style="light"/>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex:1,
    backgroundColor: '#ff6',
    alignItems: 'center',
    justifyContent: 'center',
  },
  yazi: {
  
  }
});
