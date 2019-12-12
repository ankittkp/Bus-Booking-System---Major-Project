"""
Send a message by invoking '/usr/sbin/sendmail' program

Provides smtplib compatible API for sending Internet mail messages,

Most Un*x Mail Transfer Agents (MTAs) supply a /usr/sbin/sendmail
program for queuing mail messages without requiring a local (or remote)
SMTP server.

Compatible with 'sendmail' and 'postfix' MTAs.
Not meant for use inside single-process containers!

Your mileage may vary.
Offer void where prohbited by law.
Prior results do not guarantee a similar outcome.
Packaged by weight, not volume, some settling may have occurred.
Members of the immediate family are not eligible to participate and win.
"""

__author__ = 'Phil Budne <phil@ultimate.com>'
__version__ = '2.0'
__revision__ = '$Id: sendmail.py,v 1.10 2018/10/27 19:05:22 phil Exp $'

#       Copyright (c) 2009,2018 Philip Budne (phil@ultimate.com)
#       Licensed under the MIT licence: 
#       
#       Permission is hereby granted, free of charge, to any person
#       obtaining a copy of this software and associated documentation
#       files (the "Software"), to deal in the Software without
#       restriction, including without limitation the rights to use,
#       copy, modify, merge, publish, distribute, sublicense, and/or sell
#       copies of the Software, and to permit persons to whom the
#       Software is furnished to do so, subject to the following
#       conditions:
#       
#       The above copyright notice and this permission notice shall be
#       included in all copies or substantial portions of the Software.
#       
#       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#       EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#       OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#       NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
#       HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#       WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#       FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#       OTHER DEALINGS IN THE SOFTWARE.

import subprocess
import smtplib                  # for SMTPException
import sys
import os

OS_OK = getattr(os, 'OS_OK', 0)

class SendmailException(smtplib.SMTPException):
    """
    subclass of smtplib.SMTPException for (crude) compatibility
    """

class Sendmail(object):
    """smtplib compatible object for queuing e-mail messages
       using local sendmail program"""

    # take as initializer arg? search for it?
    SENDMAIL = '/usr/sbin/sendmail'
    debug = False

    def set_debuglevel(self, debug):
        """enable debug output"""
        self.debug = debug

    def sendmail(self, from_addr, to_addrs, msg, mail_options=()):
        """invoke local "sendmail" program to send a message.
        `from_addr' is envelope sender string (may be empty)
        `to_addrs' is list of envelope recipient addresses
                   string will be treated as a list with 1 address.
        `msg' is headers and body of message to be sent
        `mail_options' is iterable of options ('8bitmime')"""

        # -i flag: do NOT treat bare dot as EOF
        cmd = [self.SENDMAIL, '-i']
        if from_addr:           # envelope sender?
            cmd.append('-f%s' % from_addr)
        if isinstance(to_addrs, tuple): # be liberal
            to_addrs = list(to_addrs)
        elif not isinstance(to_addrs, list):
            to_addrs = [to_addrs]

        if sys.version_info[0] >= 3 or isinstance(msg, unicode):
            msg = msg.encode('utf-8')
            # need to force 8BIT (if length changed)?

        if '8bitmime' in mail_options:
            cmd.append('-B8BITMIME')
        # avoid shell / quoting issues
        proc = subprocess.Popen(cmd + to_addrs, shell=False,
                                stdin=subprocess.PIPE,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        out, err = proc.communicate(input=msg)
        ret = proc.returncode   # not clearly documented?!
        if self.debug:
            print("ret: %d" % ret)
            print("stdout:")
            print(out)
            print("stderr:")
            print(err)

        if ret != OS_OK:
            # values suggested by Mateo Roldan:
            raise SendmailException(ret, out, err)
        return {}

    def quit(self):
        """for SMTP compatibility"""
