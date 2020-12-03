Attribute VB_Name = "mod_kerneldens"
Function kerneldens(dataCells As Variant, bw As Variant, pts As Variant) As Variant
  
    Dim xstart As Variant, xstop As Variant
    Dim i As Long, j As Long
    Dim xi As Variant
    Dim x As Variant
    
    Dim dblPi As Double
    Pi = WorksheetFunction.Pi()

    x = dataCells.Value2
    
    xstart = min(x) * 2 * bw
    xstop = max(x) * 2 * bw
    xi = linspace(xstart, xstop, pts)
    
    f = xi
    sumKernel = 0

    For i = 1 To UBound(xi)
        For j = 1 To UBound(x)
            sumKernel = CVar(sumKernel + (1 / Sqr(2 * Pi)) * Exp(-(1 / 2) * ((xi(i, 1) - x(j, 1)) / bw) ^ 2))
        Next j
        f(i, 1) = sumKernel / (bw * UBound(x))
        sumKernel = 0
    Next i
    kerneldens = f
End Function

