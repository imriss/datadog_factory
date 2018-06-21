# 180621: Reza Farrahi (imriss@yahoo.com)
import ast
from checks import AgentCheck
from subprocess import check_output

class coolserviceCheck(AgentCheck):
    def check(self, instance):
        metric_prefix = self.init_config.get('metric_prefix', 'coolservice')
        coolservice_status = self.get_coolservice_state()
        self.gauge('%s.coolservice_status' % metric_prefix, coolservice_status['status'])

    def get_coolservice_state(self):
        coolservice_path = self.init_config.get('coolservice_path', '/usr/local/bin/coolservice.sh')
        coolservice_status = ast.literal_eval(check_output([coolservice_path, "status"]))
        return {
                    'status': coolservice_status
                }

if __name__ == '__main__':
    check.check(instance)
