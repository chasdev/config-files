
# Proposed Rules for Development

> Following are my candidate "rules" for a development organization.  It is imperative such rules be defined through collaboration with hands-on developers \-- it will _not_ likely be beneficial for those who do not actively code to attempt to mandate such rules.

## Git

1. Projects should adopt Git unless a pessimistic locking model is needed (e.g., when 'source' is a binary format such as Oracle Forms). Any project that is not already using Git should probably be considered in jeopardy -- as this is a likely indicator there are other problems.  _Managers should NOT be allowed to make exceptions to this rule, and developers should not tolerate any attempt to do so._
1. All developers should use Git at the bash/zsh command line so that they understand basic workflows. (Windows users should use Cygwin.)
1. All developers should learn proper git usage including best practices and popular workflows. This includes working in a branch, rebasing a branch, merging into master, tagging, adding/removing files, creating personal repos, 'forking' repositories, sending 'pull requests', squashing local commits, etc.
1. All developers should have 'read' access to any repository (except those repositories for which executive leadership has determined should have limited visibility).
1. All developers should be encouraged to 'fork' any repository and issue a pull request for that repository whenever a contribution is made within that fork.

## A Release Process

1. All projects should adopt [Semantic Versioning 2.0](http://semver.org). 
1. All new projects should adopt a modern release process. This may be as simple as adopting the very common 'development-staging-production' branching model, but may be more complex (e.g., incorporating 'qa' branches, maintenance release branches, etc).
 - Assuming a basic workflow as above, the 'development' branch referenced above should be used for introducing all code changes. Code changes should never be introduced in the later-in-the-workflow branches. This is true even for last minute changes during system test -- it is a rule that is never broken.
 - The 'access control' of particular branches should be tailored accordingly (e.g., while many/all developers may be able to commit/push to 'development', it is likely only a few should be able to merge code into staging and even fewer into production.)
 - All releases should be built from 'production' or a similar positioned branch (e.g., a one-off hotfix branch).
1. It is appropriate for project teams to limit 'write' access to their repositories, and to require those external to the project to fork repositories and send pull requests in order to contribute code.
 - It is an obligation for project teams to respond to pull requests in a timely manner.
 - It is acceptable for a project to use a long-running fork of another repository, however a decision to use a fork for an extended period of time should be coordinated with the respective parties and senior management.
1. Encryption and personally identifiable information (PII) should never be allowed in any repository, and particular attention should be used to protect staging and production branches.  When providing access to Git repositories, scanning should consider the full repository history (to safeguard against encryption or PII that was added and subsequently removed from the project but is still accessible within the repository history). Export compliance should be established and reviewed by legal councel prior to release of software that may be exported.

## Technical Documentation

1. All technical documentation should be written in Github Flavored Markdown (GFM) and placed under version control. A developer should not need to launch MSFT Word just to look at a technical project-related document.
1. Every repository should have a README.md file at the root of the project, and this should be published as HTML after every push (either by the repository hosting service or a Continous Integration (CI) server).

## Automated Tests

1. All developers are expected to author tests, including 'unit', 'integration', and 'functional' and to run these tests locally before pushing code.
1. All new projects should use a BDD framework if one exists for their technology/platform. BDD practices and frameworks should be adopted within existing projects as well, even if not a 'rule'.
1. All (or practically all) testing on new projects should be automated. This includes system testing and performance testing. Manual testing requirements preclude continous deployment. 

## Continuous Integration

1. All projects should use continuous integration servers that perform automated testing. CI servers should be employed to verify each pushed commit within minutes of the push and failures should be communicated to the developer and team.
1. CI servers should perform ECCN and PII scans on a daily basis, against the repository history. That is, the repository history should be scanned back to the last point where the scans were performed the day before. No Git repository may be cloned to an externally accessible location unless the entire repository history has been determined to be 'clean'. (Alternatively server Git hooks could be used to scan every commit being pushed.)
1. Nightly CI builds should create and exercise the 'official release' artifacts (i.e., an installer if one is used by clients). CI builds used for testing pushed commits need not create and use 'official release' artifacts.
1. A project *may* incorporate code quality checks into either Git hooks and or CI build processes. (Developers may also add hooks locally to perform checks before allowing a push.) However, code quality tools and beautifier tools are not necessarilly desirable, as they can be used as crutches. It is imho better to simply improve the culture of the organization versus concentrating on 'enforcement' tools like this that can be misused. _Note: If employed, code quality  tools should be configured with modern rules prior to incorporation, as the the default rules may promote use of outdated 'C'-style guidance (e.g., like only allowing a single return statement in a method - a rule that is arguably counter to modern coding style where methods are very small)._

## Server VMs

1. All developers should be able to use "basic" tools, and be required to do so at least on shared server VMs. The strongly recommended development tools include: bash/zsh, tmux, vim (with the broadly-used plugins and commonly-used customizations), git, Node.js, Ruby, Python (many tools require these even if they are not used directly), Java 6/7, groovy
1. All developers should have the ability to host a VM locally as their primary developement environment. (This is especially true for Windows users who should be encouraged to use either a local or remote VM as their primary development environment.)
1. Developers should be encouraged to connect to shared tmux sessions instead of screen sharing. This allows for more effective co-development (e.g., pair programming sessions).

## Local Development Environments

1. All developers should be able to run a VM as described above in this proposal.
1. Mac users should use gvm to manage groovy/grails/gradle (if using) and brew as their package manager.
1. Developers should be able to use the tools for which they are comfortable (despite the requirements for 'having' standard tooling we do not want to preclude use of a developer's favorate IDE or editor.)
1. All developers 'should' be able to procure:
  - a licensed version of Sublime Text 2. All developers are encouraged to use 'vintage' mode to re-inforce their use of vim key bindings. Sublime Text 2 is a nice 'bridge' for those not familiar with vim, before adopting a tmux/vim based environment.
  - a licensed version of IntelliJ IDEA (still quite useful for debugging even if not used regularly for editing code).
  - a licensed version of Visual Studio and related tooling if needed.

## Project Management

1. Developers should be expected to challenge management decisions that are intended to reduce short-term risk if it is believed longer-term harm to the development organization (e.g., unnecessary dual maintenance) is likely. Such decisions require discussion. This does not infer managers don't want to do the right thing, only that they may lack the perspective of a hands-on developer when assessing benefits and drawbacks of such decisions. 
1. Roadmap milestones that are known internally to be unrealistic should never be allowed to remain on the roadmap or to drive the development effort.
1. Project managers and or product owners who do not understand the technology being used for a project should be re-assigned (or be given the opportunity to gain such knowledge if time permits).
1. User conferences should not be allowed to influence development timelines and technical decisions in order to 'show' something.
1. Product architects should have an equal authority for specifying requirements as do product managers/owners.
 - Product architects are expected to collaborate with product management to ensure common understanding of the impact of a requirement.
 - Product architects should have final say regarding the acceptance of a requirement for development, and should be allowed to reject requirements that result in a 'loss of internal simplicity'. Disagreements should be reviewed by the Chief Architect and executive leadership.

----

_The above are the opinions of Charlie Hardt and do not necessarily reflect the opinions of my employer._

