<!--
 Copyright 2022 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->

<script setup>
// Vue Component Imports
import ConfigurationOpenshiftClusterListItem from "./configuration-openshift-cluster-list-item.vue";
</script>
<template>
  <div class="container mb-4">
    <!-- Start Deployment Configs Items -->
    <div class="flex flex-col">
      <ConfigurationOpenshiftClusterListItem
        v-for="cluster in configurationClusters"
        :key="cluster.id"
        :clusterconfig="cluster"
        :v-show="itemCount > 0"
      >
      </ConfigurationOpenshiftClusterListItem>
      <p class="font-bold" v-show="itemCount === 0">
        No Openshift Cluster configurations found.
      </p>
    </div>
    <!-- End Deployment Config Items -->
  </div>
</template>

<script>
// External Pinia Store Imports
import { useConfigurationsClusters } from "../stores/configurations/clusters";

// Plugin & Package Imports
import { mapState } from "pinia";
export default {
  data() {
    return {};
  },

  methods: {},

  computed: {
    ...mapState(useConfigurationsClusters, {
      configurationClusters: "getAllClusters",
    }),

    itemCount() {
      if (
        this.configurationClusters !== undefined &&
        this.configurationClusters.length >= 0
      ) {
        return this.configurationClusters.length;
      }
      return 0;
    },
  },
};
</script>
