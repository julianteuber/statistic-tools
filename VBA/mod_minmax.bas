Attribute VB_Name = "mod_minmax"
Public Function min(x As Variant) As Variant
Dim temp
For Each temp In x
    min = temp
    Exit For
Next
For Each temp In x
    If temp < min Then min = temp
Next
End Function

Public Function max(x As Variant) As Variant
Dim temp
For Each temp In x
    max = temp
    Exit For
Next
For Each temp In x
    If temp > max Then max = temp
Next
End Function
