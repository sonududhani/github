name: Hello World Workflow

on:
  push:
    branches:
      - main  # or whichever branch you want to trigger it on

jobs:
  say-hello:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Print Hello Message
        run: |
          echo "Hello from GitHub Actions!"
          echo "Today's date is: $(date)"
          echo "Listing current directory:"
          ls -la

      - name: Set and Show Output Variable
        id: example_step
        run: echo "message=This is an output message" >> $GITHUB_OUTPUT

      - name: Use Output from Previous Step
        run: echo "Received message: ${{ steps.example_step.outputs.message }}"
