Class MLTEST.Data.PassengersInfo Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor)
{

/// Description
Property DateOfData As %DateTime;

/// Description
Property Line As %String;

/// Description
Property Passengers As %Integer;

Storage Default
{
<Data name="PassengersInfoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DateOfData</Value>
</Value>
<Value name="3">
<Value>Line</Value>
</Value>
<Value name="4">
<Value>Passengers</Value>
</Value>
</Data>
<DataLocation>^MLTEST.Data.PassengersInfoD</DataLocation>
<DefaultData>PassengersInfoDefaultData</DefaultData>
<IdLocation>^MLTEST.Data.PassengersInfoD</IdLocation>
<IndexLocation>^MLTEST.Data.PassengersInfoI</IndexLocation>
<StreamLocation>^MLTEST.Data.PassengersInfoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
