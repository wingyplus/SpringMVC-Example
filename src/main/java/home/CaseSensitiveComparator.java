package xyz.sample.baremvc.home;

import java.util.Comparator;
import org.springframework.stereotype.Service;

@Service
public class CaseSensitiveComparator implements Comparator<String> {
    public int compare(String s1, String s2) {
        assert s1 != null && s2 != null;
        return String.CASE_INSENSITIVE_ORDER.compare(s1, s2);
    }
}
