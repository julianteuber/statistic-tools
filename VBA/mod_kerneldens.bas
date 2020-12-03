Attribute VB_Name = "mod_kerneldens"
Function kerneldens(dataCells As Variant, bw As Variant, pts As Variant) As Variant
  
    Dim xi_beg As Variant, xi_end As Variant
    Dim i As Long, j As Long
    Dim xi As Variant
    Dim x As Variant
    
   ' calculate pi via worksheet function
    Dim pi As Double
    pi = WorksheetFunction.pi()
    
    ' array of distributed values
    Set dataCells = Intersect(dataCells.Parent.UsedRange, dataCells)
    x = dataCells.Value2
    
    ' array of values the densitiy is been calculated for
    xi_beg = min(x) - 3 * Sqr(bw)
    xi_end = max(x) + 3 * Sqr(bw)
    xi = linspace(xi_beg, xi_end, pts)
    
    ' first row of f: value xi for which kde is calculated
    ' second row of f: result of the density calculation at xi
    Dim f As Variant
    ReDim f(1 To pts, 1 To 2)
    For i = 1 To pts
        f(i, 1) = xi(i, 1)
    Next i
    
    Dim sum_xi As Variant
    sum_xi = 0

    For i = 1 To UBound(xi)
        For j = 1 To UBound(x)
            sum_xi = sum_xi + (1 / Sqr(2 * pi)) * Exp(-(1 / 2) * ((xi(i, 1) - x(j, 1)) / bw) ^ 2)
        Next j
        f(i, 2) = sum_xi / (bw * UBound(x))
        sum_xi = 0
    Next i
    
    kerneldens = f
    
End Function
