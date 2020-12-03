Attribute VB_Name = "Module3"
Function linspace(a As Variant, b As Variant, num As Variant) As Variant()
    
    Dim temp() As Variant
    Dim i As Long
    
    ReDim temp(1 To num, 1 To 1)
    
    For i = 1 To num
        temp(i, 1) = a + i * (b - a) / (num - 1)
    Next i
    
    linspace = temp
    
End Function
