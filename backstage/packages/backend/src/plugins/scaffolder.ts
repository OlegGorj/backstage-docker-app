import { CatalogClient } from '@backstage/catalog-client';
import { createRouter } from '@backstage/plugin-scaffolder-backend';
import { Router } from 'express';
import type { PluginEnvironment } from '../types';
import { ServerPermissionClient } from '@backstage/plugin-permission-node';


export default async function createPlugin(
  env: PluginEnvironment,
): Promise<Router> {
  const catalogClient = new CatalogClient({
    discoveryApi: env.discovery,
  });
  const permissionClient = ServerPermissionClient.fromConfig(env.config, {
    discovery: env.discovery,
    tokenManager: env.tokenManager,
  });

  return await createRouter({
    logger: env.logger,
    config: env.config,
    database: env.database,
    reader: env.reader,
    catalogClient,
    identity: env.identity as any,
    permissions: permissionClient,
  });
}



// export default async function createPlugin(
//   env: PluginEnvironment,
// ): Promise<Router> {
//   const catalogClient = new CatalogClient({
//     discoveryApi: env.discovery,
//   });
//   const permissionClient = ServerPermissionClient.fromConfig(env.config, {
//     discovery: env.discovery,
//   });

//   return await createRouter({
//     logger: env.logger,
//     config: env.config,
//     database: env.database,
//     reader: env.reader,
//     catalogClient,
//     identity: env.identity as any,
//     permissions: permissionClient,
//   });
//   });
// }
