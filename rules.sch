<?xml version="1.0" encoding="UTF-8"?>

<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <include href="library.sch#avoidWordInElement"/>
  <include href="library.sch#avoidPhraseInElement"/>
  <include href="library.sch#avoidEndFragment"/>
  <include href="library.sch#avoidAttributeInElement"/>
  <include href="library.sch#recommendElementInParent"/>
  <include href="library.sch#restrictWords"/>
  <include href="library.sch#restrictAttributes"/>
  <include href="library.sch#restrictCharacters"/>
  <include href="library.sch#restrictNesting"/>
  <include href="library.sch#restrictNumberOfChildren"/>
  <include href="library.sch#restrictChildrenElements"/>
  <include href="library.sch#avoidDuplicateContent"/>
  <include href="library.sch#requireContentAfterElement"/>
  <include href="library.sch#dita-allowedElementsForClass"/>
  <include href="library.sch#dita-allowOnlyBlockElements"/>
  <include href="library.sch#dita-checkAttributeValue"/>
  <include href="library.sch#avoidChildElement"/>
  <include href="library.sch#avoidElement"/>
  <include href="library.sch#dita-allowedPhraseForClass"/>
  <include href="library.sch#checkKeyUsage"/>

  <pattern is-a="dita-allowedElementsForClass">
    <param name="elementClass" value="topic/topic"/>
    <param name="allowedElementNames" value="task, reference, concept, glossentry, troubleshooting"/>
    <param name="message" value="This is not an allowed topic type."/>
  </pattern>

  <pattern is-a="avoidDuplicateContent"
    see="http://confluence/display/DOC/Short+Description+Examples">
    <param name="matchElement" value="shortdesc"/>
    <param name="targetElement" value="title"/>
    <param name="message" value="Do not restate the title in the short description."/>
  </pattern>

  <pattern is-a="restrictWords" see="http://confluence/display/DOC/Short+Description+Examples">
    <param name="parentElement" value="shortdesc"/>
    <param name="minWords" value="1"/>
    <param name="maxWords" value="50"/>
    <param name="message"
      value="Short descriptions are required and should be 50 words or less. 35 is recommended."/>
  </pattern>

  <pattern is-a="restrictCharacters"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_dita_topic-based_authoring.html">
    <param name="parentElement" value="title"/>
    <param name="minChars" value="1"/>
    <param name="maxChars" value="75"/>
    <param name="normalize" value="yes"/>
    <param name="message" value="The title offers a brief description of the topic. "/>
  </pattern>

  <pattern is-a="avoidPhraseInElement">
    <param name="element" value="title"/>
    <param name="phrase" value="using"/>
    <param name="message"
      value="Titles reflect user tasks or goals. Avoid tasks that use product focused phrases "/>
  </pattern>

  <pattern is-a="avoidPhraseInElement">
    <param name="element" value="title"/>
    <param name="phrase" value="working with"/>
    <param name="message"
      value="Titles reflect user tasks or goals. Avoid tasks that use product focused phrases "/>
  </pattern>

  <pattern is-a="avoidPhraseInElement"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_shortdesc.html">
    <param name="element" value="shortdesc"/>
    <param name="phrase" value="this section"/>
    <param name="message" value="Avoid self-referencing phrases"/>
  </pattern>

  <pattern is-a="avoidPhraseInElement"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_shortdesc.html">
    <param name="element" value="shortdesc"/>
    <param name="phrase" value="this chapter"/>
    <param name="message" value="Avoid self-referencing phrases"/>
  </pattern>

  <pattern is-a="avoidPhraseInElement"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_shortdesc.html">
    <param name="element" value="shortdesc"/>
    <param name="phrase" value="the following"/>
    <param name="message" value="Avoid self-references phrases"/>
  </pattern>

  <pattern is-a="avoidPhraseInElement"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_shortdesc.html">
    <param name="element" value="shortdesc"/>
    <param name="phrase" value="this topic"/>
    <param name="message" value="Avoid self-references phrases"/>
  </pattern>

  <pattern is-a="avoidPhraseInElement"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_shortdesc.html">
    <param name="element" value="shortdesc"/>
    <param name="phrase" value="this page"/>
    <param name="message" value="Avoid self-references phrases"/>
  </pattern>

  <pattern is-a="avoidPhraseInElement">
    <param name="element" value="p"/>
    <param name="phrase" value="concept definition"/>
    <param name="message" value="Remove boilerplate text, "/>
  </pattern>

  <pattern is-a="avoidPhraseInElement">
    <param name="element" value="p"/>
    <param name="phrase" value="context for the current task"/>
    <param name="message" value="Remove boilerplate text from topic, "/>
  </pattern>

  <pattern is-a="avoidPhraseInElement">
    <param name="element" value="cmd"/>
    <param name="phrase" value="task step"/>
    <param name="message" value="Remove boilerplate text from topic, "/>
  </pattern>

  <pattern is-a="recommendElementInParent"
    see="http://example.com/styleguide/webhelp/harmonic_task_rules.html">
    <param name="parent" value="task"/>
    <param name="element" value="taskbody"/>
    <param name="message" value="Task body is required."/>
  </pattern>

  <pattern is-a="restrictNumberOfChildren"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_task.html">
    <param name="parentElement" value="steps"/>
    <param name="element" value="step"/>
    <param name="min" value="2"/>
    <param name="max" value="12"/>
    <param name="message"
      value="Task topics should have more than 1 step and less than 12 steps. Use &lt;steps-unordered&gt; element for single step tasks. "
    />
  </pattern>

  <pattern is-a="restrictNumberOfChildren"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_task.html">
    <param name="parentElement" value="steps-unordered"/>
    <param name="element" value="step"/>
    <param name="min" value="1"/>
    <param name="max" value="12"/>
    <param name="message" value="Consider breaking long tasks into multiple topics."/>
  </pattern>

  <pattern is-a="restrictNumberOfChildren"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_task.html">
    <param name="parentElement" value="substeps"/>
    <param name="element" value="substep"/>
    <param name="min" value="2"/>
    <param name="max" value="8"/>
    <param name="message"
      value="Task topics should have more than 1 substep and less than 8 substeps."/>
  </pattern>

  <pattern is-a="restrictNumberOfChildren"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_task.html">
    <param name="parentElement" value="steps"/>
    <param name="element" value="image"/>
    <param name="min" value="0"/>
    <param name="max" value="3"/>
    <param name="message" value="Consider reducing the number of images in steps."/>
  </pattern>

  <pattern is-a="restrictNumberOfChildren"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_task.html">
    <param name="parentElement" value="steps-unordered"/>
    <param name="element" value="image"/>
    <param name="min" value="0"/>
    <param name="max" value="3"/>
    <param name="message" value="Consider reducing the number of images in steps."/>
  </pattern>

  <pattern is-a="dita-checkAttributeValue"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_harmonic_guidelines_images.html">
    <param name="element" value="image"/>
    <param name="attribute" value="href"/>
    <param name="filetype" value="png"/>
    <param name="message" value=".png is the recommended file format for images"/>
  </pattern>

  <pattern is-a="restrictNesting">
    <param name="element" value="ul"/>
    <param name="maxNestingLevel" value="3"/>
    <param name="message" value="Consider reducing the number of nested lists."/>
  </pattern>

  <pattern is-a="restrictNesting">
    <param name="element" value="ol"/>
    <param name="maxNestingLevel" value="3"/>
    <param name="message" value="Consider reducing the number of nested lists."/>
  </pattern>

  <pattern is-a="avoidWordInElement"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_task.html">
    <param name="element" value="b"/>
    <param name="word" value="To"/>
    <param name="message"
      value="Do not add a procedure heading (prochead) to tasks. This was a FrameMaker style and is no longer used."
    />
  </pattern>

  <pattern is-a="dita-allowedPhraseForClass"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_topic_best_practice_task.html">
    <param name="elementClass" value="task/task"/>
    <param name="element" value="title"/>
    <param name="phrase" value="ing"/>
    <param name="message" value="Start task topic titles with the gerund verb form. "/>
  </pattern>

  <pattern is-a="checkKeyUsage"
    see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_content_reuse_best_practices.html">
    <param name="element" value="*[contains(@class,' topic/body ')]"/>
    <param name="maxKeys" value="10"/>
    <param name="message" value="Consider using generic terms. "/>
  </pattern>
  
 
  <pattern is-a="avoidElement" see="http://10.11.100.244:8585/TechPubs/TechPubs_Standards/harmonic_authoring_publishing_help/CURRENT/#_techpubs_standards/topics/concept/c_dita_elements_list_topic.html">
    <param name="element" value="wintitle"/>
    <param name="message" value="Harmonic TechPubs avoids the &lt;wintitle&gt; element. Use &lt;uicontrol&gt;."/>
  </pattern>
 
</schema>
