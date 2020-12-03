Attribute VB_Name = "mod_kerneldens"
Function kerneldens(dataCells As Variant, bw As Variant, pts As Variant) As Variant
  
    Dim xifirst As Variant, xilast As Variant
    Dim i As Long, j As Long
    Dim xi As Variant
    Dim x As Variant
    
   ' calculate pi via worksheet function
    Dim pi As Double
    pi = WorksheetFunction.pi()
    
    ' array of distributed values
    x = dataCells.Value2
    
    ' array of values the densitiy is been calculated for
    xifirst = min(x) - 3 * Sqr(bw)
    xilast = max(x) + 3 * Sqr(bw)
    xi = linspace(xifirst, xilast, pts)
    
    f = xi
    sumKernel = 0

    For i = 1 To UBound(xi)
        For j = 1 To UBound(x)
            sumKernel = CVar(sumKernel + (1 / Sqr(2 * pi)) * Exp(-(1 / 2) * ((xi(i, 1) - x(j, 1)) / bw) ^ 2))
        Next j
        f(i, 1) = sumKernel / (bw * UBound(x))
        sumKernel = 0
    Next i
    kerneldens = f
End Function
