// Each resource type is a #Schema Definition which uses the disjunction operator (|) to say the schema must unify with one of these entries, like an “or” statement.

// Define some top-level Definitions for the Kubernetes resources
#Schema: #CrdSchema | #KubeAccess | #KubeIdentity | #KubeResources

// Group the schema definitions by the type of resource they are defining.
#KubeAccess: #ClusterRole | #RoleBinding | #ClusterRoleBinding // | #Role    // <== Uncomment this #Role to add Role support

#KubeIdentity: #ServiceAccount | #NetworkPolicy

#KubeResources: #Deployment | #StatefulSet | #Secret | #ConfigMap | #Service

// Add all different types of resource Definitions to the schema following the errors.
#CrdSchema: {
	apiVersion: "apiextensions.k8s.io/v1"
	kind:       "CustomResourceDefinition"

	...
}

#ServiceAccount: {
	apiVersion: "v1"
	kind:       "ServiceAccount"

	...
}

// #Role: {           // <== Uncomment this block to add Role support
// 	apiVersion: "rbac.authorization.k8s.io/v1"
// 	kind:       "Role"

// 	...
// }

#RoleBinding: {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleBinding"

	...
}

#ClusterRoleBinding: {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRoleBinding"

	...
}

#ClusterRole: {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRole"

	...
}

#ConfigMap: {
	apiVersion: "v1"
	kind:       "ConfigMap"

	...
}

#Secret: {
	apiVersion: "v1"
	kind:       "Secret"

	...
}

#Service: {
	apiVersion: "v1"
	kind:       "Service"

	...
}

#Deployment: {
	apiVersion: "apps/v1"
	kind:       "Deployment"

	...
}

#StatefulSet: {
	apiVersion: "apps/v1"
	kind:       "StatefulSet"

	...
}

#NetworkPolicy: {
	apiVersion: "networking.k8s.io/v1"
	kind:       "NetworkPolicy"

	...
}
