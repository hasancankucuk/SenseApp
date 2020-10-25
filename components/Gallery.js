import React, {useState} from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Button ,Text, TextInput, View, Alert, Image, Platform,TouchableOpacity } from 'react-native';
import * as Permissions from 'expo-permissions';
import * as ImagePicker from 'expo-image-picker';
import styles from "./style.js"
class Gallery extends React.Component{
    state={
        image: null
    }
    
    render(){
        const { image } = this.state   
        return(
            <View style={styles.container}>
                <Text style={styles.yazi}>Hoş Geldiniz</Text>
                <Button title="Galeriden seçmek için buraya tıklayın" onPress={this.openGallery}/>
                {image && <Image source={image} style={styles.imageContainer} />}
                <StatusBar style="dark"/>
            </View>
        )
    }
    openGallery=async()=>{
      try{
          let response = await ImagePicker.launchImageLibraryAsync({
              mediaTypes: ImagePicker.MediaTypeOptions.Images,
              allowsEditing: false,
              aspect: [4, 3]
          })
          if(!response.cancelled){
              const source = {uri: response.uri}
              this.setState({ image: source})
              this.classifyImage()
          }
      } catch(error){
          console.log(error)
      }
    }

}
export default Gallery;
