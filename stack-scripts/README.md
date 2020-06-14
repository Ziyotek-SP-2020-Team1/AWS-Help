# Stack Scripts

These script is made for to ease the need to open browser each time you want to create stack and no need to type really long AWS commands to create it in your terminal. This is were it comes handy with createStack script that does that for you, it features:

- Template Validation before stack is created
- Checking if inputed stack name is already present in cloudformation or not
- Continuously reporting the progress of stack creation until it completes or fails
- In event of Stack failure it displays which LogicalId failed and description of the error

There is also deleteStack script that is helpful to fastly delete stack stack from your comfort of your terminal. It features:

- Lists active stacks to delete
- Comprehensive feedback if it was successful or if there was an error

## Todo:

- [x] Template Validation
- [x] Checking cloudformation if similar stack name was already used or not
- [x] Show the progress of stack creation
- [x] Give detailed error of what went wrong
- [ ] Let user to input the template file location
