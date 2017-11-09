<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <!-- assert = tell me if it is not true -->
  <!-- Harmonic DITA constraints  -->

  <pattern abstract="true" id="avoidWordInElement">
    <title>Avoid a word in a DITA element</title>
    <p>Issue a warning if a specific word appears in an element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element that should not contain the specified word.</desc>
      </parameter>
      <parameter>
        <name>word</name>
        <desc>Specifies the word to avoid.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the specified word is found in the
          element.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT001" context="$element">
      <assert test="not(tokenize(normalize-space(.), ' ') = '$word')" role="warning">HLIT001
        $message </assert>
    </rule>
  </pattern>

  <!--  KLL 04-28-2016 rule to avoid text strings instead of single word-->
  <pattern abstract="true" id="avoidPhraseInElement">
    <title>Avoid a phrase in a DITA element</title>
    <p>Issue a warning if a phrase (multiple words) appears in an element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element that should not contain the specified phrase.</desc>
      </parameter>
      <parameter>
        <name>phrase</name>
        <desc>Specifies the phrase to avoid.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the phrase is found in the element.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT002" context="$element">
      <assert test="not(text()[contains(lower-case(.), '$phrase')])" role="warning">HLIT002 $message
        such as "$phrase" </assert>
    </rule>
  </pattern>

  <pattern abstract="true" id="avoidEndFragment">
    <title>Issue a warning if an element ends with a specified fragment or character</title>
    <p>This pattern allows you to advise users not to use a specific end sequence to end an
      element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element that should not contain the specified fragment.</desc>
      </parameter>
      <parameter>
        <name>fragment</name>
        <desc>Specifies the text (ending) to check.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the fragment is found in the element.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT003" context="$element">
      <assert test="not(ends-with(normalize-space(.), '$fragment'))" role="warning">HLIT003 $message
      </assert>
    </rule>
  </pattern>

  <pattern abstract="true" id="avoidAttributeInElement">
    <title>Avoid an attribute inside a specified element</title>
    <p>Issue a warning if an attribute appears in an element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element that should not contain the attribute.</desc>
      </parameter>
      <parameter>
        <name>attribute</name>
        <desc>Specifies the attribute to avoid.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the attribute is found in the element.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT004" context="$element">
      <assert test="not(@$attribute)" role="warning">HLIT004 $message </assert>
    </rule>
  </pattern>

  <pattern abstract="true" id="avoidChildElement">
    <title>Avoid a child element inside a parent element</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>elementParent</name>
        <desc>Specifies the element that should not contain the child element.</desc>
      </parameter>
      <parameter>
        <name>elementChild</name>
        <desc>Specifies the element to avoid.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the attribute is found in the element.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT005" context="$elementParent">
      <assert test="not($elementChild)" role="warning">HLIT005 $message </assert>
    </rule>
  </pattern>

  <pattern id="recommendElementInParent" abstract="true">
    <title>Recommend usage of an element inside a parent element</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parent</name>
        <desc>Specifies the parent element.</desc>
      </parameter>
      <parameter>
        <name>element</name>
        <desc>Specifies the element that should appear in the parent.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message the end user will see when recommended child is not found in the
          parent.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT006" context="$parent">
      <assert test="$element" role="warning">HLIT006 $message </assert>
    </rule>
  </pattern>

  <!--  KLL 2016-07-27 Rule added to minimize elements with particular attribute value -->
  <pattern id="restrictAttributes" abstract="true">
    <title>Limit the number of elements that have a particular attribute.</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>attribute</name>
        <desc>Specifies the attribute to check.</desc>
      </parameter>
      <parameter>
        <name>maxElements</name>
        <desc>Specifies the maximum number of elements allowed.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the word counts falls outside the limit.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT007" context="$element">
      <let name="ditaTags" value="count(//$element[@$attribute])"/>
      <assert test="$ditaTags &lt;= $maxElements" role="warning">HLIT007 There are more than
        $maxElements elements with $attribute in this topic. $message </assert>
    </rule>
  </pattern>

  <pattern id="restrictWords" abstract="true">
    <title>Limit the number of words an element can contain.</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parentElement</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>minWords</name>
        <desc>Specifies the minimum number of words allowed.</desc>
      </parameter>
      <parameter>
        <name>maxWords</name>
        <desc>Specifies the maximum number of words allowed.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the word counts falls outside the limit.</desc>
      </parameter>
    </parameters>

    <!--  KLL  05-10-2016 updated to ignore <element> with <ph> or @conref-->
    <!--  KLL 2017-10-02 Exclude topics with IDs that begin with conref-->
    <rule id="HLIT008"
      context="$parentElement[not(@conref)][not(child::ph)][not(ancestor::*[starts-with(@id, 'conref')])]">
      <let name="words" value="count(tokenize(normalize-space(.), ' '))"/>
      <assert test="$words &lt;= $maxWords" role="warning">HLIT008 $message You have <value-of
          select="$words"/>
        <value-of
          select="
            if ($words = 1) then
              ' word'
            else
              ' words'"
        />. </assert>
      <assert test="$words >= $minWords" role="warning"> $message You have <value-of select="$words"/>
        <value-of
          select="
            if ($words = 1) then
              ' word'
            else
              ' words'"
        />. </assert>
    </rule>
  </pattern>

  <pattern id="restrictCharacters" abstract="true">
    <title>Limit the number of characters an element can contain.</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parentElement</name>
        <desc>Specifies the element to check. </desc>
      </parameter>
      <parameter>
        <name>minChars</name>
        <desc>Specifies the minimum number of characters allowed.</desc>
      </parameter>
      <parameter>
        <name>maxChars</name>
        <desc>Specifies the maximum number of characters allowed.</desc>
      </parameter>
      <parameter>
        <name>normalize</name>
        <desc>Set this to "true" or "yes" if you want to merge adjacent text nodes and remove empty
          ones before counting characters </desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the character counts falls outside the
          limit.</desc>
      </parameter>
    </parameters>

    <!--  KLL 2016-08-22 updated to ignore <element> with <ph> or @conref-->
    <rule id="HLIT009" context="$parentElement[not(@conref)][not(child::ph)]">
      <let name="characters"
        value="
          string-length(if ($normalize = ('true',
          'true()',
          'yes')) then
            normalize-space(.)
          else
            .)"/>
      <assert test="$characters &lt;= $maxChars" role="warning">HLIT009 $message It is recommended
        not to exceed $maxChars <value-of
          select="
            if ($maxChars = 1) then
              ' character'
            else
              ' characters'"
        />. You have <value-of select="$characters"/>
        <value-of
          select="
            if ($characters = 1) then
              ' character'
            else
              ' characters'"
        />. </assert>
      <assert test="$characters >= $minChars" role="warning">HLIT009 $message It is recommended to have at
        least $minChars <value-of
          select="
            if ($maxChars = 1) then
              ' character'
            else
              ' characters'"
        />. You have <value-of select="$characters"/>
        <value-of
          select="
            if ($characters = 1) then
              ' character'
            else
              ' characters'"
        />. </assert>
    </rule>
  </pattern>

  <pattern id="restrictNesting" abstract="true">
    <title>Restrict nesting levels for an element</title>
    <p>Check the number of nesting levels of an element. This may be used for example to enforce
      that an element should not be nested more than 3 levels.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element that to check.</desc>
      </parameter>
      <parameter>
        <name>maxNestingLevel</name>
        <desc>Specifies the maximum nesting level allowed for the specified element. When the number
          of ancestors of the same element type exceeds this number a warning message
          appears.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message that should be presented to the user if the maximum nesting level is
          exceeded.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT010" context="$element">
      <assert test="count(ancestor::$element) &lt;= $maxNestingLevel" role="warning">HLIT010
        $message </assert>
    </rule>
  </pattern>

  <pattern id="restrictNumberOfChildren" abstract="true">
    <title>Restrict the number of child elements </title>
    <p>Limit the number of child elements for a parent element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parentElement</name>
        <desc>Specifies the element that we should check for nesting.</desc>
      </parameter>
      <parameter>
        <name>element</name>
        <desc>Specifies the element we will look for as child element.</desc>
      </parameter>
      <parameter>
        <name>min</name>
        <desc>The minimum number of occurrences allowed.</desc>
      </parameter>
      <parameter>
        <name>max</name>
        <desc>The maximum number of occurrences allowed.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>A message we should present to the user in case the number of children elements is not
          within the specified limits.</desc>
      </parameter>
    </parameters>
    <!--  Consider excluding conref topics  [not(contains(@id, 'step'))]-->
    <!--  KLL 2017-10-02 Exclude topics with IDs that begin with conref-->
    <!--  KLL 2017-09-19 -->
    <rule id="HLIT011" context="$parentElement[not(ancestor::*[starts-with(@id, 'conref')])]">
      <let name="children" value="count( descendant-or-self:: $element )"/>
      <assert test="$children &lt;= $max" role="warning">HLIT011 $message You have <value-of
          select="$children"/>
        <value-of
          select="
            if ($children = 1) then
              ' $element'
            else
              concat('$element', 's')"
        />. </assert>
      <assert test="$children >= $min" role="warning">HLIT011 $message You have <value-of select="$children"/>
        <value-of
          select="
            if ($children = 1) then
              ' $element'
            else
              concat('$element', 's')"
        />. </assert>
    </rule>
  </pattern>

  <pattern id="restrictChildrenElements" abstract="true">
    <title>Restrict the elements that can appear inside a parent element</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>parentElement</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>allowedChildren</name>
        <desc>Specifies a comma separated list of element local names.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when an element that is not in the list appears in
          the parent element.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT012" context="$parentElement/*">
      <let name="elements"
        value="tokenize(translate(normalize-space('$allowedChildren'), ' ', ''), ',')"/>
      <assert test="local-name() = $elements" role="warning">HLIT012 $message The element '<value-of
          select="local-name()"/>' is not in the list of allowed elements: ($allowedChildren).
      </assert>
    </rule>
  </pattern>

  <pattern id="avoidDuplicateContent" abstract="true">
    <title>Avoid having two elements with the same content</title>
    <p>Use this to identify an element that has the same content as one of its sibling elements and
      notify the user if that is not what you want.</p>
    <p>As parameters we have <emph>matchElement</emph> that specifies the element to be checked,
        <emph>targetElement</emph> that specifies a sibling element to check against and
        <emph>message</emph> that specifies an additional message we should output in case the
      matched element contains the same content as the target element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>matchElement</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>targetElement</name>
        <desc>Specifies a sibling element name to check against.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>A message we should display to the user in case the matched element contains the same
          content as the target.</desc>
      </parameter>
    </parameters>
    <!--  KLL 2016-08-22 updated to ignore <element> with <ph> or @conref-->
    <!--  KLL 2017-08-10 Added logic to ignore topics with @id that starts with conref -->
    <rule id="HLIT013" context="$matchElement[not(@conref)][not(child::ph)] [not(ancestor::*[starts-with(@id, 'conref')])]">
      <assert
        test="not(
          normalize-space((preceding-sibling::$targetElement, following-sibling::$targetElement)[1]) 
          = normalize-space(.)
        )"
        role="warning">HLIT013 $message </assert>
    </rule>
  </pattern>

  <pattern id="requireContentAfterElement" abstract="true">
    <title>Check that we still have some text content following a specified element.</title>
    <p>As parameters we have <emph>element</emph> that specifies the element to be checked and
        <emph>message</emph> that specifies an additional message we should output in case there is
      no content after the specified element.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>A message we should display to the user in case there is no content after the
          reference element.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT014" context="$element">
      <assert test="following::text()[normalize-space() != '']" role="warning">HLIT014 $message
      </assert>
    </rule>
  </pattern>

  <!-- DITA specific patterns start with 'F' prefix -->

  <pattern id="dita-allowedElementsForClass" abstract="true">
    <title>Check element names for a DITA element that has a specified class value.</title>
    <p>Check that the element name matched by a specified class value is in a list of allowed
      element names.</p>
    <p>As parameters we have <emph>elementClass</emph> that specifies the DITA class value of the
      element to be checked, <emph>allowedElementNames</emph> that specifies the comma separated
      list of allowed element names and <emph>message</emph> that specifies an additional message we
      should output in case the matched element is not in the allowed list of elements.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>elementClass</name>
        <desc>Specifies the DITA class value of the element that we should check.</desc>
      </parameter>
      <parameter>
        <name>allowedElementNames</name>
        <desc>Specifies a comma separated list of element local names.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>An additional message we should display to the user in case the matched element is not
          found in the list of allowed elements.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT015" context="*[contains(@class, ' $elementClass ')]">
      <let name="elements"
        value="tokenize(translate(normalize-space('$allowedElementNames'), ' ', ''), ',')"/>
      <assert test="local-name() = $elements" role="warning">HLIT015 $message The element '<value-of
          select="local-name()"/>' is not in the list of allowed elements: ($allowedElementNames).
      </assert>
    </rule>
  </pattern>

  <pattern id="dita-allowOnlyBlockElements" abstract="true">
    <title>Allow only DITA block elements inside an element</title>
    <p>Check that a specified element contains only DITA block elements and no inline elements.</p>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the DITA element that we should check to contain only block elements.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The message that appears when the specified element contains text or inline
          elements.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT016" context="$element[text()/normalize-space(.) != '']" role="warning">
      <assert test="false()">HLIT016 $message </assert>
    </rule>
    <rule id="HLIT017" context="$element/*">
      <assert
        test="substring-before(substring-after(@class, ' '), ' ') = document('blockElements.xml')//*:class"
        >HLIT017 $message </assert>
    </rule>
  </pattern>

  <pattern id="dita-checkAttributeValue" abstract="true">
    <title>Check that an element attribute is set to a particular file type.</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>attribute</name>
        <desc>Specifies the attribute value the element should contain.</desc>
      </parameter>
      <parameter>
        <name>filetype</name>
        <desc>Specifies the 3-character file type to check.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the specified attribute value does not
          appear.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT018" context="$element">
      <assert test="ends-with(@$attribute, '$filetype')" role="warning">HLIT018 $message </assert>
    </rule>
  </pattern>

  <!--  KLL 2017-08-01 Added logic to ignore topics with @id that starts with conref-->
  <!--  KLL 2017-10-05 Update logic to ignore elements with @conref -->
  <pattern id="dita-allowedPhraseForClass" abstract="true">
    <title>Look for a phrase in an element that has a specified class value.</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>elementClass</name>
        <desc>Specifies the DITA class value of the element that we should check.</desc>
      </parameter>
      <parameter>
        <name>element</name>
        <desc>Specifies the element to check.</desc>
      </parameter>
      <parameter>
        <name>phrase</name>
        <desc>Specifies the phrase to find.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>An additional message we should display to the user in case the matched element is not
          found in the list of allowed elements.</desc>
      </parameter>
    </parameters>
    <!--  KLL 2017-09-19 Ignore topics with the @id prefix conref -->
    <rule id="HLIT019"
      context="*[not(contains(@conref, '')) and contains(@class, ' $elementClass ')]">
      <assert test="$element[(text()[contains(lower-case(.), '$phrase')])]" role="warning">HLIT019
        $message </assert>
    </rule>
  </pattern>

  <!--  KLL 2017-02-15 Scriptorium provided rule for duplicate keys-->
  <pattern id="checkKeyUsage" abstract="true">
    <title>Look for keys used multiple times in a topic</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>The element to examine</desc>
      </parameter>
      <parameter>
        <name>maxKeys</name>
        <desc>The maximum number of incidences of a key to trap.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>An additional message we should display to the user in case the matched element is not
          found in the list of allowed elements.</desc>
      </parameter>
    </parameters>

    <rule id="HLIT020" context="$element//*[@keyref]">
      <let name="keyref" value="@keyref"/>
      <assert test="count(following::*[@keyref = $keyref]) &lt; $maxKeys" role="warning">HLIT020 key
          '<value-of select="$keyref"/>' is used more than <value-of select="$maxKeys"/> times.
        $message </assert>
    </rule>
  </pattern>

  <pattern abstract="true" id="avoidElement">
    <title>Avoid a particular element</title>
    <parameters xmlns="http://oxygenxml.com/ns/schematron/params">
      <parameter>
        <name>element</name>
        <desc>Specifies the element to avoid.</desc>
      </parameter>
      <parameter>
        <name>message</name>
        <desc>The warning message that appears when the attribute is found in the element.</desc>
      </parameter>
    </parameters>
    <rule id="HLIT021" context="*[@contains, ' topic/topic ']">
      <report test="ancestor::*[@contains, ' topic/topic ']/$element" role="warning">HLIT021
        $message </report>
    </rule>
  </pattern>

</schema>
