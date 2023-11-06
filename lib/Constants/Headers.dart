import '../main.dart';

var AuthHeader = {
  // 'Accept': 'application/json',
  // "Content-Type": "application/json",
  "Authorization": "Token $token",
  "Vary": "Accept"
};

var UnAuthHeader = {
  //'Accept': 'application/json',
  // 'X-App-Type': "learner", //
//  "Content-Type": "application/json",
  //"Authorization": "Bearer $token",
  "Vary": "Accept"
};

var ImageHeader = {
  'Accept': 'application/json',
  "Authorization": "Token $token",
};
