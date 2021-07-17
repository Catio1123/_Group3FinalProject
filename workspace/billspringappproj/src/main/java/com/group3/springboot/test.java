package com.group3.springboot;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class test {
	public static void main(String[] args){
        Map<String, String> map = new HashMap<>();
        map.put("01", "a");
        map.put("02", "b");
        map.put("03", "c");
        //獲取map集合中的所有鍵的Set集合, keySet()
        Set keySet = map.keySet();
        //有了set集合就可以獲取迭代器
        Iterator it = keySet.iterator();
        while(it.hasNext()){
            String key = (String) it.next();
            //有了鍵就可以通過map集合的get方法獲取其對應的値
            String value = map.get(key);
            System.out.println("key: " + key + ", vaule: " + value);
            //key:01, vaule: a  key: 02,vaule: b  key: 03, vaule: c
        }
    }
}
