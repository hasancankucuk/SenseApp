import React, {useState} from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Button ,Text, TextInput, View, Alert, Image, Platform,TouchableOpacity, Linking } from 'react-native';
import * as Permissions from 'expo-permissions';
import * as ImagePicker from 'expo-image-picker';
import * as MediaLibrary from 'expo-media-library';
import styles from "./style.js"
import { Camera } from 'expo-camera'


class Photo extends React.Component{
    state={
        image: null
    }
    render() {
        const { image } = this.state
        return(
            <View styles={styles.container}>
                <Button styles={styles.btn} title="Kamerayı açmak için buraya tıklayın" onPress={this.openCamera} />
                {image && <Image source={image} style={styles.photoContainer} />}                
            </View>
        );
    }
    openCamera=async()=>{
        try{
            //let response  = await Permissions.getAsync(Permissions.CAMERA);
            let response = await ImagePicker.launchCameraAsync({
                cameraType: 'front',
                quality: 1
            })
            if(!response.cancelled){
                const source = {uri: response.uri}
                this.setState({ image: source})
                this.classifyImage()
            }
        }catch(error){
            console.log(error)
        }
        
    }

}
export default Photo;