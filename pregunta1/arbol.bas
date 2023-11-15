#macro setArbol(tipo)
Type Arbol
    Hoja As tipo
    RamaI As Arbol Ptr
    RamaD As Arbol Ptr
End Type
Function esMaxHeapSimetrico(a As Arbol Ptr) As Boolean
  If a->RamaI <> 0 And a-> RamaD <> 0 Then
    Return (((a->RamaI)->Hoja = (a->RamaD)->Hoja) = a->Hoja) And esMaxHeapSimetrico(a->RamaI) And esMaxHeapSimetrico(a->RamaD)
  Elseif a->RamaI <> 0 Then
    Return (a->RamaI->Hoja = a->Hoja) And esMaxHeapSimetrico(a->RamaI)
  Elseif a->RamaD <> 0 Then
    Return (a->RamaD->Hoja = a->Hoja) And esMaxHeapSimetrico(a->RamaD)
  End If
End Function
#endmacro

' Por ejemplo, para el caso de que el árbol sea de enteros
setArbol(Integer)