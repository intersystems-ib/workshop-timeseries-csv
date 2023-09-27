/// 
Class MLTEST.BP.PopulateTable Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='MLTEST.PassengersMap.Record' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='PassengersInfo' type='MLTEST.Data.PassengersInfo' instantiate='1' />
<property name='ModelCreated' type='%String' initialexpression='""' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Result' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='ErrorMessage' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='5000' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1750' >
<if name='Check EOF' condition='$L(request.Year) = 0' xpos='200' ypos='250' xend='200' yend='1650' >
<true>
<trace name='Trace of EOF' value='"Is end of file"' xpos='740' ypos='400' />
<sql name='Check if model exists' xpos='740' ypos='500' >
<![CDATA[SELECT MODEL_NAME into :context.ModelCreated FROM INFORMATION_SCHEMA.ML_MODELS WHERE MODEL_NAME = 'PassengersPrediction']]>
</sql>
<if name='Model exists' condition='context.ModelCreated = ""' xpos='740' ypos='600' xend='740' yend='1150' >
<true>
<trace name='Trace of model cleaning' value='"Model exists, proceding to delete it"' xpos='875' ypos='750' />
<sql name='Delete model' xpos='875' ypos='850' >
<![CDATA[DROP MODEL PassengersPrediction]]>
</sql>
<sql name='Clean pivot table' xpos='875' ypos='950' >
<![CDATA[TRUNCATE TABLE MLTEST_Data.PassengersLine]]>
</sql>
<trace name='Trace model deleted' value='"Model has been removed"' xpos='875' ypos='1050' />
</true>
</if>
<sql name='Bulk insert of data' xpos='740' ypos='1250' >
<![CDATA[INSERT INTO MLTEST_Data.PassengersLine (DateOfData, Line1, Line2, Line3, Line4, Line5, Line6, Line7, Line8, Line9, Line10) SELECT DateOfData, 
(SELECT MAX(s1.Passengers) FROM MLTEST_Data.PassengersInfo s1 WHERE s1.Line = 1 AND s1.DateOfData = s.DateOfData) as Line1, 
(SELECT MAX(s2.Passengers) FROM MLTEST_Data.PassengersInfo s2 WHERE s2.Line = 2 AND s2.DateOfData = s.DateOfData) as Line2, 
(SELECT MAX(s3.Passengers) FROM MLTEST_Data.PassengersInfo s3 WHERE s3.Line = 3 AND s3.DateOfData = s.DateOfData) as Line3, 
(SELECT MAX(s4.Passengers) FROM MLTEST_Data.PassengersInfo s4 WHERE s4.Line = 4 AND s4.DateOfData = s.DateOfData) as Line4, 
(SELECT MAX(s5.Passengers) FROM MLTEST_Data.PassengersInfo s5 WHERE s5.Line = 5 AND s5.DateOfData = s.DateOfData) as Line5,
(SELECT MAX(s6.Passengers) FROM MLTEST_Data.PassengersInfo s6 WHERE s6.Line = 6 AND s6.DateOfData = s.DateOfData) as Line6, 
(SELECT MAX(s7.Passengers) FROM MLTEST_Data.PassengersInfo s7 WHERE s7.Line = 7 AND s7.DateOfData = s.DateOfData) as Line7, 
(SELECT MAX(s8.Passengers) FROM MLTEST_Data.PassengersInfo s8 WHERE s8.Line = 8 AND s8.DateOfData = s.DateOfData) as Line8, 
(SELECT MAX(s9.Passengers) FROM MLTEST_Data.PassengersInfo s9 WHERE s9.Line = 9 AND s9.DateOfData = s.DateOfData) as Line9, 
(SELECT MAX(s10.Passengers) FROM MLTEST_Data.PassengersInfo s10 WHERE s10.Line = 10 AND s10.DateOfData = s.DateOfData) as Line10 
FROM MLTEST_Data.PassengersInfo s GROUP BY DateOfData]]>
</sql>
<sql name='Create model' xpos='740' ypos='1350' >
<![CDATA[CREATE TIME SERIES MODEL PassengersPrediction PREDICTING (Line1,Line2,Line3,Line4,Line5,Line6,Line7,Line8,Line9,Line10) BY (DateOfData) FROM MLTEST_Data.PassengersLine USING {"Forward":3}
]]>
</sql>
<sql name='Train model' xpos='740' ypos='1450' >
<![CDATA[TRAIN MODEL PassengersPrediction]]>
</sql>
<trace name='Model trained trace' value='"Model trained"' xpos='740' ypos='1550' />
<call name='Export to CSV' target='PredictionToCSV' async='1' xpos='716' ypos='1686' >
<request type='Ens.Request' />
<response type='Ens.Response' />
</call>
</true>
<false>
<transform name='Transform raw data' class='MLTEST.DT.ParseDate' source='request' target='context.PassengersInfo' xpos='200' ypos='400' />
<code name='Save data in DB' xpos='200' ypos='500' >
<![CDATA[ set sc = context.PassengersInfo.%Save()
 if ($$$ISERR(sc))
 {
   set context.Result = "Error"
   set context.ErrorMessage = sc
 }
 else
 {
   set context.Result = "Success"
 }]]>
</code>
<if name='Saved successfully' condition='context.Result = "Success"' xpos='200' ypos='600' xend='200' yend='850' >
<false>
<trace name='Error message' value='"Error saving data: "_context.ErrorMessage' xpos='335' ypos='750' />
</false>
</if>
</false>
</if>
</sequence>
</process>
}

}
