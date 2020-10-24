import React, {useState} from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Button ,Text, TextInput, View, Alert, Image } from 'react-native';
import * as MediaLibrary from 'expo-media-library';
import * as Permissions from 'expo-permissions';
import * as ImagePicker from 'expo-image-picker';
import styles from "./style.js"

class Gallery extends React.Component{
    render(){
        return(
            <View style={styles.container}>
                <Text style={styles.yazi}>Hoş Geldiniz</Text>
                <Button title="Başlamak için buraya tıklayın"  onPress={this.openGallery}/>
                <Image source={{ }} style={{ width: 200, height: 200 }} />
                <StatusBar style="dark"/>
            </View>
        )
    }
    openGallery(){
        /*MediaLibrary.getPermissionsAsync()
        MediaLibrary.getAlbumsAsync('albums');*/
        ImagePicker.requestCameraRollPermissionsAsync();
        ImagePicker.getCameraRollPermissionsAsync();
        ImagePicker.launchImageLibraryAsync({
            mediaTypes: ImagePicker.MediaTypeOptions.Images,
            allowsEditing: false,
            aspect:[4,3],
            quality:1
        })
    }
}
export default Gallery;
