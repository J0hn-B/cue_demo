# CUE (Configure Unify Execute)

[CUE](https://cuelang.org/) is an open-source **Data Validation language** and inference engine with its roots in logic programming.

Instead of writing code like typical languages, **you provide values, types, definitions, and constraints** to Cue, and it **checks if what you entered is correct**.

For those familiar with [Rego](https://www.openpolicyagent.org/docs/latest/policy-language/), it's important to note that `CUE` and `Rego` are both declarative configuration languages but they have some key differences.

Overall, the choice between CUE and Rego depends on your specific use case.

If you need a general-purpose configuration language with data validation capabilities, CUE might be a better fit.

On the other hand, if your main focus is on defining and enforcing policies, [Rego](https://www.openpolicyagent.org/docs/latest/policy-language/) in combination with Open Policy Agent could be more suitable.

> CUE is still evolving and things are going to change.

This repo will display examples of how CUE can be used in different scenarios.

## Validate

`validate` dir contains the [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) installation manifests in yaml format and the CUE files to validate them.

```bash
git clone https://github.com/J0hn-B/cue_demo.git && cd validate/
```

```bash
$ tree
    .
    |-- argocd.yml          # argocd installation
    |-- check.cue           # CUE Definitions
    `-- validate_tool.cue   # Logic and the sequence of commands to run the validation.

```

To validate the argocd manifests, run the following command:

```bash
cue cmd validate
```

Follow the instructions on terminal.
