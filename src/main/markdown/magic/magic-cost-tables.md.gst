### Magic Cost Tables

### Magic Action Cost Table

| Magic Action  | Cost |
|:---------------|:--------:|
<%
local.aspects.actions.each { _row ->
    print String.format('| %s | M x %d |\n', _row[0], (int)_row[1]);
};
%>

### Magic Objectives Cost Table

| Magic Objective  | Cost |
|:---------------|:--------:|
<%
local.aspects.objects.each { _row ->
    print String.format('| %s | M x %d |\n', _row[0], (int)_row[1]);
};
%>

### Magic Ranges Cost Table

| Magic Range  | Cost | Scale |
|:---------------|:--------:|:--------:|
<%
local.aspects.ranges.each { _row ->
    print String.format('| %s | +%d | +%d MP |\n', _row[0], (int)_row[1], (int)Math.ceil(_row[1]/12.5));
};
%>

### Magic Targets Cost Table

| Magic Target  | Cost | Scale |
|:---------------|:--------:|:--------:|
<%
local.aspects.targets.each { _row ->
    print String.format('| %s | +%d | +%d MP |\n', _row[0], (int)_row[1], (int)Math.ceil(_row[1]/12.5));
};
%>

### Magic Durations Cost Table

| Magic Duration  | Cost | Scale |
|:---------------|:--------:|:--------:|
<%
local.aspects.durations.each { _row ->
    print String.format('| %s | +%d | +%d MP |\n', _row[0], (int)_row[1], (int)Math.ceil(_row[1]/12.5));
};
%>| Concentration required | x 1/2 ||
| Attack(non-instant) | x 2 ||