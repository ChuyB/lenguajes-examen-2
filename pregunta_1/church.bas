Union Church
  Cero as Integer
  Suc as Church Ptr
End Union

Function ChurchSuma (a As Church Ptr, b As Church Ptr) As Church Ptr
  If a->Cero = 0 Then
    Return b
  Elseif b->Cero = 0 Then
    Return a
  Else 
    Dim result As Church Ptr = New Church
    result->Suc = ChurchSuma(a->Suc, b)
    Return result
  End If
End Function

Function ChurchMult(n As Church Ptr, m As Church Ptr) As Church Ptr
    If n->Cero = 0 Or m->Cero = 0 Then
        Dim result As Church Ptr = New Church
        result->Cero = 0
        Return result
    Else
        Dim result As Church Ptr = ChurchSuma(n, ChurchMult(n, m->Suc))
        Return result
    End If
End Function

