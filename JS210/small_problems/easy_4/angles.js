/*

Write a function that takes a floating point number representing an angle between 0 and
360 degrees and returns a string representing that angle in degrees, minutes, and seconds.
You should use a degree symbol (˚) to represent degrees, a single quote (') to represent
minutes, and a double quote (") to represent seconds. There are 60 minutes in a degree,
and 60 seconds in a minute.

*/

const MINUTES = 60;
const SECONDS = 3600;

function dms(angle) {
  let degrees = parseInt(angle, 10);
  let minutes = parseInt((angle - degrees) * MINUTES, 10);
  let seconds = parseInt(((angle - degrees - (minutes / 60)) * SECONDS), 10);
  minutes = String(minutes).padStart(2, '0');
  seconds = String(seconds).padStart(2, '0');

  console.log(`${degrees}˚${minutes}'${seconds}"`);
}

dms(30);           // 30°00'00"
dms(76.73);        // 76°43'48"
dms(254.6);        // 254°35'59"
dms(93.034773);    // 93°02'05"
dms(0);            // 0°00'00"
dms(360);          // 360°00'00" or 0°00'00"
