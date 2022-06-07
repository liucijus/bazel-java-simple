/**
* JetBrains Space Automation
* This Kotlin-script file lets you automate build activities
* For more info, see https://www.jetbrains.com/help/space/automation.html
*/

job("Prepare Bazel project") {

    warmup(ide = Ide.Idea) {
        // path to the warm-up script
        scriptLocation = "./dev-env-warmup.sh"
        // use image specified in the devfile
        devfile = ".space/devfile.yaml"
        
        ideVersion = IdeVersion.Specific("2022.1", "Release")
    }

}
