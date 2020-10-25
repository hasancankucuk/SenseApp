import { Camera } from 'expo-camera';
import React from 'react';
import Gallery from './components/Gallery.js';
import Photo from './components/Photo.js';

class App extends React.Component{
  render() {
    return (
      <>
        <Gallery/>
        <Photo/>
      </>
    );
  }
}

export default App;