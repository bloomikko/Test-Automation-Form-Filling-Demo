# Tools/DemoQA: test automation demo for filling a web form
Testing playground with DemoQA interactive elements.
Currently contains one test suite for a test form at [ToolsQA's demo test environment site.](https://demoqa.com/automation-practice-form)

The DemoQA training site is splitted into distinct features which would have their own test suites (for example, alerts and forms are in their own folders). Should several feature sets use same keywords, they are compiled to <code>general.resource</code> file, whereas test specific keywords are in their respective test resource file.

## Tech
- Robot Framework
- Selenium

## Observations
- The form itself was pretty buggy: if this was a form running in production, the test case would have been implemented otherwise, thus making the test case fail. For demo purposes, the test case was deliberately designed to depict a successful test case. Examples:
  - Some built in Selenium functions (for example, <code>Select Radio Button</code>) were not working as there were obscuring invisible elements blocking the elements
  - Date of birth element completely crashed the site if left empty &rarr; had to come up with rather finicky solution to get it working
- The test case only depicts a happy day scenario. Naturally, negative test cases would be implemented in the future with various alternative ways to fill the form "wrong".
- Usually when I'm writing automation tests, I observe which keywords are used by many test cases and implement these keywords to their own <code>general.resource</code> file.
  - For example in this demo, every single test case would involve opening a browser, so in order to avoid writing it every time again and again, it is implemented as a general keyword which is easily accessed in the project.
  - Another example is with text inputing: very many times web automation has test cases surrounding with text inputing, another case where a more generalized keyword is beneficial in order to reduce repetitiveness of the code
