Class User.ArrayUtils Extends %RegisteredObject
{

ClassMethod list(GLOBAL As %String) As %Status
{
    Do ..iterate(GLOBAL,"")
}

ClassMethod iterate(GLOBAL As %String, CALLBACK As %String) As %Status
{
    Do iter("",1)
    Return $$$OK

iter(keys,v) 
    Set key(v)=""
    Do {
        Set key(v)=$Order(@$$globalStr(keys,key(v)))
        Quit:key(v)=""
        Set data=$Data(@$$globalStr(keys,key(v)))
        If data=1 Write !,$$globalStr(keys,key(v)),"=",@$$globalStr(keys,key(v)) ;Do @CALLBACK
        If data=10 Do iter($$keysStr(keys,key(v)),v+1)
    } While key(v)'=""

globalStr(keys,key)
    Return GLOBAL_"("_$$keysStr(keys,key)_")"

keysStr(keys,key)
    If keys'="" Set keys=keys_","
    Return keys_""""_key_""""
}

}
