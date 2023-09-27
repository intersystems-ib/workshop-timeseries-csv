Class MLTEST.DT.ParseDate Extends Ens.DataTransformDTL [ DependsOn = (MLTEST.PassengersMap.Record, MLTEST.Data.PassengersInfo) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='MLTEST.PassengersMap.Record' targetClass='MLTEST.Data.PassengersInfo' create='new' language='objectscript' >
<assign value='source.Line' property='target.Line' action='set' />
<assign value='source.Passengers' property='target.Passengers' action='set' />
<assign value='source.Year_"-"_$tr($j(source.Month,2)," ","0")_"-01"_" 00:00:00"' property='target.DateOfData' action='set' />
</transform>
}

}
