Class MLTEST.Data.PassengersLine Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor)
{

/// Description
Property DateOfData As %DateTime;

/// Description
Property Line1 As %Integer;

/// Description
Property Line2 As %Integer;

/// Description
Property Line3 As %Integer;

/// Description
Property Line4 As %Integer;

/// Description
Property Line5 As %Integer;

/// Description
Property Line6 As %Integer;

/// Description
Property Line7 As %Integer;

/// Description
Property Line8 As %Integer;

/// Description
Property Line9 As %Integer;

/// Description
Property Line10 As %Integer;

Storage Default
{
<Data name="PassengersLineDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DateOfData</Value>
</Value>
<Value name="3">
<Value>Line1</Value>
</Value>
<Value name="4">
<Value>Line2</Value>
</Value>
<Value name="5">
<Value>Line3</Value>
</Value>
<Value name="6">
<Value>Line4</Value>
</Value>
<Value name="7">
<Value>Line5</Value>
</Value>
<Value name="8">
<Value>Line6</Value>
</Value>
<Value name="9">
<Value>Line7</Value>
</Value>
<Value name="10">
<Value>Line8</Value>
</Value>
<Value name="11">
<Value>Line9</Value>
</Value>
<Value name="12">
<Value>Line10</Value>
</Value>
</Data>
<DataLocation>^MLTEST.Data.PassengersLineD</DataLocation>
<DefaultData>PassengersLineDefaultData</DefaultData>
<IdLocation>^MLTEST.Data.PassengersLineD</IdLocation>
<IndexLocation>^MLTEST.Data.PassengersLineI</IndexLocation>
<StreamLocation>^MLTEST.Data.PassengersLineS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
