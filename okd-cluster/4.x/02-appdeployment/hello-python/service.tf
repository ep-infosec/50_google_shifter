/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "kubernetes_service_v1" "svc" {
  metadata {
    name = "hello-python-svc"
    namespace = "default"
  }
  spec {
    selector = {
      app = "hello-python"
    }
    session_affinity = "ClientIP"
    port {
      name        = "service"
      port        = 5000
      target_port = 5000
      protocol    = "TCP"
    }
    type = "LoadBalancer"
  }
}
