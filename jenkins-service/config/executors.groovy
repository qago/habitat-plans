import hudson.tasks.*
import jenkins.model.*
def instance = Jenkins.getInstance()
instance.setNumExecutors(10)
instance.save()
