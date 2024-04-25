import { initializeApp } from "firebase/app"
import { getAuth } from "firebase/auth"

export const firebase_client_id = "1:384673636418:web:d37398d7a49023e3b50ddb"

/** @type {import('firebase/app').FirebaseOptions}*/
const firebaseConfig = {
  projectId: "sos-shared",
  appId: firebase_client_id,
  apiKey: "AIzaSyDtFVp_J7ubZ6okryTb8bnjVHRyOw15m_s",
  // authDomain: "sos-shared.firebaseapp.com",
  authDomain: "auth.sonicoriginal.software",
}

export const app = initializeApp(firebaseConfig)
app.automaticDataCollectionEnabled = false
// const auth = getAuth(app)
export const auth = $state(getAuth(app))
