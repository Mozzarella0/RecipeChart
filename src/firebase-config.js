import firebase from 'firebase';

const config = {
  apiKey: "AIzaSyCl7DUHsgeVqP2tMtJdy4kw4XzzXvUhJ8w",
  authDomain: "recipechart.firebaseapp.com",
  databaseURL: "https://recipechart.firebaseio.com",
  projectId: "recipechart",
  storageBucket: "recipechart.appspot.com",
  messagingSenderId: "557178705268"
};
firebase.initializeApp(config);

export default firebase;
