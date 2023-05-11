%dw 2.0
import * from dw::core::Objects
//Here i flatten an object based on my o/p requirement 
output application/json
fun flattenObject(data)= keysOf(data) reduce (obj,acc={}) ->acc ++ (
if (typeOf(data[obj])~="String" or typeOf(data[obj])~="Number" or typeOf(data[obj])~="Array") 
 {
 (obj):data[obj]
 }
 else 
 flattenObject(data[obj])
 )
---
flattenObject(payload)