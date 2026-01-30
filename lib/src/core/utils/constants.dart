import 'package:flutter/material.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';

import '../../features/train/stage/features/drill/data/model/drills_entity.dart';
import '../../features/train/stage/features/firearm/data/model/firearm_entity.dart';

const Duration kAnimationDuration = Duration(milliseconds: 200);
//
const Curve kAnimationCurve = Curves.easeIn;

//------------------------------------------  Database
const String databaseName = "pa_systems_stages.db";

//------------------------------------------  sampleImage
const String sampleImage =
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0';

//------------------------------------------  Initial Stage
StageEntity initialStageEntity = StageEntity(
    distance: kDistance,
    dominantHand: kDominanthand,
    drill: DrillsModel(drill: initailDrill),
    drillsList: initialDrillsList,
    firearm: initialFirearm,
    mode: initialMode,
    mountLocation: kMountLocation,
    sensitivity: kAimAsync,
    venue: kVanue);
//------------------------------------------  Stage Initials
DrillsEntity initailDrill = DrillsEntity(
  name: 'SharpShot Cluster',
  description: "description",
  fireType: 'System Drill',
  noOfShots: "10",
  parTimeList: [],
  isMute: 0,
);
//---------------------------
Mode initialMode = Mode(id: 3, name: 'Fixed', seconds: 300);
//---------------------------
const String kMountLocation = 'Finger';
const String kDominanthand = 'Left Hand';
const String kAimAsync = '7/2/1/1';
const String kDistance = '7 meters';
const String kVanue = 'Indoor';

//---------------------------
FirearmEntity initialFirearm = FirearmEntity(type: 'Pistol', brand: 'Bretta');

//---------------------------
List<DrillsModel>? initialDrillsList = [
  DrillsModel(
    id: 3,
    drill: DrillsEntity(
        name: 'Quick Silver',
        description: "description",
        fireType: 'System Drill',
        parTimeList: [],
        isMute: 0,
        noOfShots: "15"),
  ),
  DrillsModel(
    id: 3,
    drill: DrillsEntity(
      name: 'SharpShot Cluster',
      description: "description",
      fireType: 'System Drill',
      noOfShots: "10",
      parTimeList: [],
      isMute: 0,
    ),
  ),
  DrillsModel(
    id: 1,
    drill: DrillsEntity(
      name: 'My Fire',
      description: "description",
      fireType: 'System Drill',
      noOfShots: "8",
      parTimeList: [],
      isMute: 0,
    ),
  ),
  DrillsModel(
    id: 2,
    drill: DrillsEntity(
      name: 'Shot Name',
      description: "description",
      fireType: 'System Drill',
      noOfShots: "5",
      parTimeList: [],
      isMute: 0,
    ),
  )
];

//------------------------------------------  Bluetooth
// const String receiveCharacteristicUuid = '6e400003-b5a3-f393-e0a9-e50e24dcca9e';
const String serviceUuid = "b3a0";
const String receiveCharacteristicUuid = "b3a1";




String testingInstructionsTitle = "ShotPulse Testing Instructions";
String testingInstructionsContent = """ 
1. **Pause Mode:**
   • The system is now in **Pause** mode.

2. **Mark the Target:**
   • Create a hole on the target or use a black marker to make a visible mark.

3. **Simulate a Shot (No Live Ammo):**
   • While **ShotPulse** is attached to the **trigger guard** or mounted on your **trigger finger**, perform a **dry fire** by pulling the trigger (**ensure there’s no bullet in the firearm**).  
   • Alternatively, you can set the **PR metrics** low and tap **ShotPulse** on a hard surface to generate a vibration.

4. **Activate ShotPulse:**
   • Once the hole or black mark representing the bullet hole is on the target and **ShotPulse** detects the simulated shot, press the **Start** button.

5. **View Your Score:**
   • After you press the **Start** button, your score will be displayed on the scoreboard.
""";





String titleDisconnected= "Bluetooth Device Disconnected";
String titleDisconnectedCam= "Camera Disconnected";
String titleSessionCompleted= "Session Complete";
// String dSessionCompleted= "Your session has been completed based on the number of shots you configured in drill .You’ve successfully reached the shot count you selected, so no further shots can be added.You may now end the session to review your performance details, results, and analytics.";
String dSessionCompleted= "You’ve completed this drill. Further shots won’t be recorded. End the session to review your targets, per-shot scores, splits, and analytics.";
// String dDisconnected= "Your Aymsync Bluetooth device has been disconnected.Since the connection is lost, you can’t continue your current session.Please end the session to view the details and results of your progress so far.";
String dDisconnected= "Connection to AimSync BLE device was lost. The session has stopped and no further shots will be recorded. End the session to save and review your results.";
String dDisconnectedCam= "Connection to Camera has lost. The session has stopped and no further shots will be recorded. End the session to save and review your results.";


String autoModeTitle = "PulseAim Scoring Guide";
String continuingTitle = "Manual scoring instructions";

// String continuingContent = """
// 1. **Pause Mode:**
//    • The system is now in **Pause** mode.
//
// 2. **Mark the Target:**
//    • Create a hole on the target or use a black marker to make a visible mark.
//
// 3. **Simulate a Shot (No Live Ammo):**
//    • While **ShotPulse** is attached to the **trigger guard** or mounted on your **trigger finger**, perform a **dry fire** by pulling the trigger (**ensure there’s no bullet in the firearm**).
//    • Alternatively, you can set the **PR metrics** low and tap **ShotPulse** on a hard surface to generate a vibration.
//
// 4. **Activate ShotPulse:**
//    • Once the hole or black mark representing the bullet hole is on the target and **ShotPulse** detects the simulated shot, press the **Start** button.
//
// 5. **View Your Score:**
//    • After you press the **Start** button, your score will be displayed on the scoreboard.
//
// 6. **View Your Score:**
//    • Now that your score is displayed, you can proceed with the next step.
//
// 7. **Create Another Mark:**
//    • Make a new hole or a new bullet mark on the target.
//
// 8. **Trigger Another ShotPulse Signal:**
//    • Perform another **dry fire** or tap **ShotPulse** on a hard surface (**if using PR metrics set low**) to generate a vibration.
//
// 9. **Press Start:**
//    • Once **ShotPulse** detects the new signal, press the **Start** button on the screen.
//
// 10. **View Your Second Score:**
//    • Your second score will now be displayed. Repeat the process as needed.
// """;




String autoModeContent = ((""" 
1. **Getting Started**
• Attach the *AimSync BLE* device to your trigger finger using the silicone strap
• Position the camera or monocular so the target fits within the circle on screen
• Adjust your distance to match the target distance shown 
• Tap *Frame Target* to calibrate
• Once green lines overlay the ring lines on your target, tap *Start Shooting* to begin the drill
2. **While Shooting**
• Listen for a beep within 2 seconds after each shot—this confirms detection and you can fire again
• Your shot will appear on screen with a green marker (previous shots show red markers)
• If there's no beep within 2 seconds, your shot missed the target and scores as 0
• If it is a miss, the hourglass icon will remain visible until you take your next shot
3. **Pausing and Resuming**
• Tap Pause at any time to pause the session
• Tap Resume when you're ready to continue
4. **Ending Your Session**
• Your session ends automatically after completing the preset number of shots
• A Session Complete message will appear
• You can review your session details

     """));



String continuingContent = """ 
1. **Pause Mode**
   • Ensure the system is in Pause mode.

2. **Mark the Target**
   • Make a visible mark or hole on the target using a black marker or by creating a hole.

3. **Simulate a Shot (Dry Fire)**
   • Attach ShotPulse to the trigger guard or your trigger finger.• Perform a dry fire (ensure the firearm is unloaded).• Alternatively, tap ShotPulse on a hard surface (with low PR metrics) to generate a vibration.

4. **Activate ShotPulse**
   • Once the mark is made and the shot is simulated, press the Start button.

5. **View Your Score**
   • Your score will appear on the scoreboard.

6. **Repeat for Additional Shots**
   • Make a new mark on the target.• Trigger ShotPulse again (dry fire or tap).• Press the Start button.• View your second score.

7. **Continue as Needed**
   • Repeat the marking, shot simulation, and scoring process for additional attempts.""";