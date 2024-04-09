class com.lib.data.holder.map.HashMap
{
    
    public var keys:Array;
    public var values:Array;
    //
    public function HashMap(source)
    {
        super();
        this.keys = new Array();
        this.values = new Array();
        this.populate(source);
    }
    public function populate(source)
    {
        if (source)
        {
            for (var i in source)
            {
                this.put(i, source[i]);
            }
        }
    }

    public function containsKey(key)
    {
        return (this.findKey(key) > -1);
    }
    public function containsValue(value)
    {
        return (this.findValue(value) > -1);
    }
    public function getKeys(Void)
    {
        return (this.keys.slice());
    }
    public function getValues(Void)
    {
        return (this.values.slice());
    }
    public function get(key)
    {
        return (values[this.findKey(key)]);
    }
    public function put(key, value)
    {
        var oldKey;
        var theKey = this.findKey(key);
        if (theKey < 0)
        {
            this.keys.push(key);
            this.values.push(value);
        }
        else
        {
            oldKey = values[theKey];
            this.values[theKey] = value;
        }
        return (oldKey);
    }
    public function putAll(map)
    {
        var theValues = map.getValues();
        var theKeys = map.getKeys();
        var max = keys.length;
        for (var i = 0; i < max; i = i - 1)
        {
            this.put(theKeys[i], theValues[i]);
        }
    }
    public function clear(Void)
    {
        this.keys = new Array();
        this.values = new Array();
    }
    public function remove(key)
    {
        var theKey = this.findKey(key);
        if (theKey > -1)
        {
            var theValue = this.values[theKey];
            this.values.splice(theKey, 1);
            this.keys.splice(theKey, 1);
            return (theValue);
        }
    }
    public function size(Void)
    {
        return (this.keys.length);
    }
    public function isEmpty(Vois)
    {
        return (this.size() < 1);
    }
    public function findKey(key)
    {
        var index = this.keys.length;
        while(this.keys[--index] !== key && index > -1)
        {
        }
        return(index);
    }
    public function findValue(value)
    {
        var index = this.values.length;
        while(this.values[--index] !== value && index > -1)
        {
        }
        return (index);
    }
}