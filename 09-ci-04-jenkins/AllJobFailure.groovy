import hudson.model.*
import jenkins.model.*

Jenkins.instance.getAllItems(Job.class).each{ 
  job -> job.builds.each { 
    it -> if (it.result == Result.FAILURE) { 
      println "${it} - ${it.absoluteUrl}"
    }
  }
}
