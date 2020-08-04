from nbdime import diff_notebooks

from nbdime.prettyprint import pretty_print_notebook_diff,PrettyPrintConfig

import nbformat

def diff_notebooks(old, new):

    old = nbformat.read("old", as_version = nbformat.NO_CONVERT)

    new = nbformat.read("new", as_version = nbformat.NO_CONVERT)

    def ignore_keys(diff, keys):
      ret = []
      for v in diff:
        if v.key not in keys:
          if 'diff' in v:
            v.diff = ignore_keys(v.diff, keys)
          ret.append(v)
      return ret

    diff = ignore_keys(diff_notebooks(old, new), ['output','sources', 'outputs', 'attachments', 'metadata', 'details', 'codecell'])

    pretty_print_notebook_diff("old", "new", old, diff)

    return diff